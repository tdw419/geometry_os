; DESCRIPTION: Renders a black box of size 98x60 starting at (132, 168).
; PLAN: r0=132(x), r1=168(y), r2=98(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 168
LDI r2, 98
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
