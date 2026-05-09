; DESCRIPTION: Renders a yellow box of size 36x84 starting at (210, 93).
; PLAN: r0=210(x), r1=93(y), r2=36(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 93
LDI r2, 36
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
