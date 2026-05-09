; DESCRIPTION: Renders a green box of size 18x115 starting at (234, 22).
; PLAN: r0=234(x), r1=22(y), r2=18(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 22
LDI r2, 18
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
