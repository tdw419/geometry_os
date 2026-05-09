; DESCRIPTION: Composite: . Then Renders a green disk with center (78, 95) and radius 65. Then Creates a magenta rectangular region at (121, 53) spanning 77 by 97 pixels.
; PLAN: r0=78(x), r1=95(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=121(x), r1=53(y), r2=77(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green disk with center (78, 95) and radius 65.
; PLAN: r0=78(x), r1=95(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 95
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a magenta rectangular region at (121, 53) spanning 77 by 97 pixels.
; PLAN: r0=121(x), r1=53(y), r2=77(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 53
LDI r2, 77
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
