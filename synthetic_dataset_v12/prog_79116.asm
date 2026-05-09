; DESCRIPTION: Renders a yellow box of size 93x15 starting at (150, 185).
; PLAN: r0=150(x), r1=185(y), r2=93(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 185
LDI r2, 93
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
