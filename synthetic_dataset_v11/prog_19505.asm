; DESCRIPTION: Renders a green box of size 35x73 starting at (165, 80).
; PLAN: r0=165(x), r1=80(y), r2=35(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 80
LDI r2, 35
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
