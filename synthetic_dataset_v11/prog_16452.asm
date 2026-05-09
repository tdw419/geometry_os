; DESCRIPTION: Renders a green box of size 48x65 starting at (129, 163).
; PLAN: r0=129(x), r1=163(y), r2=48(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 163
LDI r2, 48
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
