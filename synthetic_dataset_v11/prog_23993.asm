; DESCRIPTION: Renders a yellow box of size 80x26 starting at (163, 146).
; PLAN: r0=163(x), r1=146(y), r2=80(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 146
LDI r2, 80
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
