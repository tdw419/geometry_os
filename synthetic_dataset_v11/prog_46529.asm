; DESCRIPTION: Composite: . Then Creates a black rectangular region at (70, 93) spanning 36 by 91 pixels. Then Renders a yellow disk with center (169, 85) and radius 14.
; PLAN: r0=70(x), r1=93(y), r2=36(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=169(x), r1=85(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a black rectangular region at (70, 93) spanning 36 by 91 pixels.
; PLAN: r0=70(x), r1=93(y), r2=36(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 93
LDI r2, 36
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (169, 85) and radius 14.
; PLAN: r0=169(x), r1=85(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 85
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
