; DESCRIPTION: Composite: . Then Renders a black line between points (44, 69) and (55, 105). Then Creates a white rectangular region at (96, 3) spanning 44 by 99 pixels.
; PLAN: r0=44(x1), r1=69(y1), r2=55(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=96(x), r1=3(y), r2=44(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black line between points (44, 69) and (55, 105).
; PLAN: r0=44(x1), r1=69(y1), r2=55(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 69
LDI r2, 55
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white rectangular region at (96, 3) spanning 44 by 99 pixels.
; PLAN: r0=96(x), r1=3(y), r2=44(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 3
LDI r2, 44
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
