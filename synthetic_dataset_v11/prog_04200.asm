; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (130, 50) spanning 99 by 10 pixels. Then Renders a red disk with center (100, 80) and radius 65.
; PLAN: r0=130(x), r1=50(y), r2=99(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=100(x), r1=80(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a yellow rectangular region at (130, 50) spanning 99 by 10 pixels.
; PLAN: r0=130(x), r1=50(y), r2=99(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 50
LDI r2, 99
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (100, 80) and radius 65.
; PLAN: r0=100(x), r1=80(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 80
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
