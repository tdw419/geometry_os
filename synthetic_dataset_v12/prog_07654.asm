; DESCRIPTION: Renders a green box of size 47x44 starting at (114, 130).
; PLAN: r0=114(x), r1=130(y), r2=47(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 130
LDI r2, 47
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
