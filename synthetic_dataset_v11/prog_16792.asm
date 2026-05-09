; DESCRIPTION: Composite: . Then Creates a orange circular shape at (110, 169) with radius 59. Then Renders a green box of size 29x25 starting at (71, 163).
; PLAN: r0=110(x), r1=169(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=71(x), r1=163(y), r2=29(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange circular shape at (110, 169) with radius 59.
; PLAN: r0=110(x), r1=169(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 169
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a green box of size 29x25 starting at (71, 163).
; PLAN: r0=71(x), r1=163(y), r2=29(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 163
LDI r2, 29
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
