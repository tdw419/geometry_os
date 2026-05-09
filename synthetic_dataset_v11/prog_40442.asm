; DESCRIPTION: Renders a blue box of size 30x27 starting at (175, 129).
; PLAN: r0=175(x), r1=129(y), r2=30(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 129
LDI r2, 30
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
