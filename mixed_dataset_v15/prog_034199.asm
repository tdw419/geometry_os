; DESCRIPTION: Renders a green box of size 12x44 starting at (270, 197).
; PLAN: r0=270(x), r1=197(y), r2=12(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 197
LDI r2, 12
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
