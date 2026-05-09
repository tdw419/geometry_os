; DESCRIPTION: Renders a green box of size 99x84 starting at (31, 21).
; PLAN: r0=31(x), r1=21(y), r2=99(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 21
LDI r2, 99
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
