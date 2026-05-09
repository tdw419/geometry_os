; DESCRIPTION: Renders a green box of size 22x61 starting at (402, 112).
; PLAN: r0=402(x), r1=112(y), r2=22(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 112
LDI r2, 22
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
