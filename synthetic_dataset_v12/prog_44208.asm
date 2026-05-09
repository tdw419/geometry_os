; DESCRIPTION: Renders a yellow box of size 60x70 starting at (125, 163).
; PLAN: r0=125(x), r1=163(y), r2=60(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 163
LDI r2, 60
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
