; DESCRIPTION: Renders a green box of size 80x90 starting at (336, 112).
; PLAN: r0=336(x), r1=112(y), r2=80(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 112
LDI r2, 80
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
