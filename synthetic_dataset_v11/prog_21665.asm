; DESCRIPTION: Renders a green box of size 86x99 starting at (160, 3).
; PLAN: r0=160(x), r1=3(y), r2=86(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 3
LDI r2, 86
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
