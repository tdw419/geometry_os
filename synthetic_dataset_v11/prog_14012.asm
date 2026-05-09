; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (46, 170) spanning 71 by 78 pixels. Then Renders a red disk with center (147, 179) and radius 77.
; PLAN: r0=46(x), r1=170(y), r2=71(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=147(x), r1=179(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a cyan rectangular region at (46, 170) spanning 71 by 78 pixels.
; PLAN: r0=46(x), r1=170(y), r2=71(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 170
LDI r2, 71
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (147, 179) and radius 77.
; PLAN: r0=147(x), r1=179(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 179
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
