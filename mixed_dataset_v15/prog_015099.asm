; DESCRIPTION: Places a cyan 26x76 rectangle at position (185, 162).
; PLAN: r0=185(x), r1=162(y), r2=26(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 162
LDI r2, 26
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
