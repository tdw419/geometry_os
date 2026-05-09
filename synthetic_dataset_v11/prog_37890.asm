; DESCRIPTION: Renders a green box of size 54x37 starting at (175, 142).
; PLAN: r0=175(x), r1=142(y), r2=54(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 142
LDI r2, 54
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
