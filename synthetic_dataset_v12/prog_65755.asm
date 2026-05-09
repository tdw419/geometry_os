; DESCRIPTION: Renders a yellow box of size 35x109 starting at (300, 8).
; PLAN: r0=300(x), r1=8(y), r2=35(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 8
LDI r2, 35
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
