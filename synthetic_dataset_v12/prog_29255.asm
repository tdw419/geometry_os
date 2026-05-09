; DESCRIPTION: Renders a green box of size 91x70 starting at (347, 86).
; PLAN: r0=347(x), r1=86(y), r2=91(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 86
LDI r2, 91
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
