; DESCRIPTION: Places a cyan 69x26 rectangle at position (121, 173).
; PLAN: r0=121(x), r1=173(y), r2=69(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 173
LDI r2, 69
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
