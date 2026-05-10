; DESCRIPTION: Renders a white box of size 20x31 starting at (417, 86).
; PLAN: r0=417(x), r1=86(y), r2=20(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 86
LDI r2, 20
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
