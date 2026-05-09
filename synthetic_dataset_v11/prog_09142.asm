; DESCRIPTION: Renders a green box of size 118x21 starting at (30, 196).
; PLAN: r0=30(x), r1=196(y), r2=118(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 196
LDI r2, 118
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
