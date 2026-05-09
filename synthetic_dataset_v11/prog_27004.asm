; DESCRIPTION: Composite: . Then Renders a cyan line between points (97, 112) and (59, 217). Then Creates a blue circular shape at (72, 116) with radius 46.
; PLAN: r0=97(x1), r1=112(y1), r2=59(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=72(x), r1=116(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan line between points (97, 112) and (59, 217).
; PLAN: r0=97(x1), r1=112(y1), r2=59(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 112
LDI r2, 59
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue circular shape at (72, 116) with radius 46.
; PLAN: r0=72(x), r1=116(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 116
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
