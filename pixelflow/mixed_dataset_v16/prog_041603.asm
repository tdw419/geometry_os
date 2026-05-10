; DESCRIPTION: Renders a yellow box of size 17x48 starting at (317, 93).
; PLAN: r0=317(x), r1=93(y), r2=17(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 93
LDI r2, 17
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
