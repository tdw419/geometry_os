; DESCRIPTION: Renders a green box of size 90x60 starting at (188, 132).
; PLAN: r0=188(x), r1=132(y), r2=90(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 132
LDI r2, 90
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
