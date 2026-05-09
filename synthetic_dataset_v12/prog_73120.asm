; DESCRIPTION: Renders a yellow box of size 98x81 starting at (75, 172).
; PLAN: r0=75(x), r1=172(y), r2=98(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 172
LDI r2, 98
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
