; DESCRIPTION: Renders a yellow box of size 92x93 starting at (70, 4).
; PLAN: r0=70(x), r1=4(y), r2=92(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 4
LDI r2, 92
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
