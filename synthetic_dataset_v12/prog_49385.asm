; DESCRIPTION: Renders a green box of size 106x20 starting at (363, 142).
; PLAN: r0=363(x), r1=142(y), r2=106(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 142
LDI r2, 106
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
