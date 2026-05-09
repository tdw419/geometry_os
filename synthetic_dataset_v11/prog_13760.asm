; DESCRIPTION: Composite: . Then Creates a green rectangular region at (89, 186) spanning 16 by 54 pixels. Then Renders a yellow disk with center (65, 141) and radius 61.
; PLAN: r0=89(x), r1=186(y), r2=16(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=65(x), r1=141(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a green rectangular region at (89, 186) spanning 16 by 54 pixels.
; PLAN: r0=89(x), r1=186(y), r2=16(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 186
LDI r2, 16
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (65, 141) and radius 61.
; PLAN: r0=65(x), r1=141(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 141
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
