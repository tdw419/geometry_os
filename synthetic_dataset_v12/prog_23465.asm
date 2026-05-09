; DESCRIPTION: Renders a green box of size 24x65 starting at (444, 72).
; PLAN: r0=444(x), r1=72(y), r2=24(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 72
LDI r2, 24
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
