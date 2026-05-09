; DESCRIPTION: Renders a green box of size 99x77 starting at (186, 105).
; PLAN: r0=186(x), r1=105(y), r2=99(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 105
LDI r2, 99
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
