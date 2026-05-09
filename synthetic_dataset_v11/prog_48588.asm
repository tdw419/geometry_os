; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (123, 10) spanning 107 by 114 pixels. Then Renders a red disk with center (104, 192) and radius 46.
; PLAN: r0=123(x), r1=10(y), r2=107(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=104(x), r1=192(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a yellow rectangular region at (123, 10) spanning 107 by 114 pixels.
; PLAN: r0=123(x), r1=10(y), r2=107(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 10
LDI r2, 107
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (104, 192) and radius 46.
; PLAN: r0=104(x), r1=192(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 192
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
