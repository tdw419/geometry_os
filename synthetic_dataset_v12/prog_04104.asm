; DESCRIPTION: Renders a green box of size 99x94 starting at (231, 14).
; PLAN: r0=231(x), r1=14(y), r2=99(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 14
LDI r2, 99
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
