; DESCRIPTION: Renders a green box of size 83x99 starting at (406, 114).
; PLAN: r0=406(x), r1=114(y), r2=83(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 114
LDI r2, 83
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
