; DESCRIPTION: Composite: . Then Creates a green rectangular region at (140, 141) spanning 61 by 43 pixels. Then Renders a yellow disk with center (149, 146) and radius 19.
; PLAN: r0=140(x), r1=141(y), r2=61(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=149(x), r1=146(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a green rectangular region at (140, 141) spanning 61 by 43 pixels.
; PLAN: r0=140(x), r1=141(y), r2=61(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 141
LDI r2, 61
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (149, 146) and radius 19.
; PLAN: r0=149(x), r1=146(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 146
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
