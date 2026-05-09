; DESCRIPTION: Composite: . Then Renders a blue disk with center (174, 150) and radius 77. Then Creates a magenta rectangular region at (44, 217) spanning 47 by 29 pixels.
; PLAN: r0=174(x), r1=150(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=44(x), r1=217(y), r2=47(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (174, 150) and radius 77.
; PLAN: r0=174(x), r1=150(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 150
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a magenta rectangular region at (44, 217) spanning 47 by 29 pixels.
; PLAN: r0=44(x), r1=217(y), r2=47(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 217
LDI r2, 47
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
