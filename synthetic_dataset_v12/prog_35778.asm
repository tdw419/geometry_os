; DESCRIPTION: Renders a green box of size 20x56 starting at (470, 140).
; PLAN: r0=470(x), r1=140(y), r2=20(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 140
LDI r2, 20
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
