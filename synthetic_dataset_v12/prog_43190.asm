; DESCRIPTION: Renders a green box of size 14x75 starting at (297, 17).
; PLAN: r0=297(x), r1=17(y), r2=14(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 17
LDI r2, 14
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
