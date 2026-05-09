; DESCRIPTION: Composite: . Then Renders a red disk with center (148, 101) and radius 43. Then Creates a cyan rectangular region at (66, 83) spanning 59 by 104 pixels.
; PLAN: r0=148(x), r1=101(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=66(x), r1=83(y), r2=59(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red disk with center (148, 101) and radius 43.
; PLAN: r0=148(x), r1=101(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 101
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a cyan rectangular region at (66, 83) spanning 59 by 104 pixels.
; PLAN: r0=66(x), r1=83(y), r2=59(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 83
LDI r2, 59
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
