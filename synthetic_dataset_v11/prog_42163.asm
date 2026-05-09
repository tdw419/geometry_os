; DESCRIPTION: Renders a yellow box of size 115x117 starting at (120, 75).
; PLAN: r0=120(x), r1=75(y), r2=115(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 75
LDI r2, 115
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
