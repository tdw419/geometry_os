; DESCRIPTION: Composite: . Then Renders a green box of size 113x106 starting at (126, 46). Then Creates a black circular shape at (175, 90) with radius 77.
; PLAN: r0=126(x), r1=46(y), r2=113(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=175(x), r1=90(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a green box of size 113x106 starting at (126, 46).
; PLAN: r0=126(x), r1=46(y), r2=113(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 46
LDI r2, 113
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (175, 90) with radius 77.
; PLAN: r0=175(x), r1=90(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 90
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
