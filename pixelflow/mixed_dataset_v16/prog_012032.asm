; DESCRIPTION: Places a cyan 69x68 rectangle at position (137, 9).
; PLAN: r0=137(x), r1=9(y), r2=69(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 9
LDI r2, 69
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
