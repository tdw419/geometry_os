; DESCRIPTION: Places a cyan 52x108 rectangle at position (187, 69).
; PLAN: r0=187(x), r1=69(y), r2=52(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 69
LDI r2, 52
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
