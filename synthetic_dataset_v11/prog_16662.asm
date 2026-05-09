; DESCRIPTION: Renders a green box of size 99x13 starting at (16, 8).
; PLAN: r0=16(x), r1=8(y), r2=99(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 8
LDI r2, 99
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
