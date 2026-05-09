; DESCRIPTION: Renders a purple box of size 48x117 starting at (353, 54).
; PLAN: r0=353(x), r1=54(y), r2=48(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 54
LDI r2, 48
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
