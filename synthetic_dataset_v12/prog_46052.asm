; DESCRIPTION: Renders a green box of size 40x81 starting at (329, 54).
; PLAN: r0=329(x), r1=54(y), r2=40(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 54
LDI r2, 40
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
