; DESCRIPTION: Renders a yellow box of size 65x84 starting at (188, 125).
; PLAN: r0=188(x), r1=125(y), r2=65(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 125
LDI r2, 65
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
