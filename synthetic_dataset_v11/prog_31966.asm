; DESCRIPTION: Composite: . Then Renders a black disk with center (94, 138) and radius 57. Then Draws a white line from (181, 3) to (172, 113).
; PLAN: r0=94(x), r1=138(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=181(x1), r1=3(y1), r2=172(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (94, 138) and radius 57.
; PLAN: r0=94(x), r1=138(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 138
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white line from (181, 3) to (172, 113).
; PLAN: r0=181(x1), r1=3(y1), r2=172(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 3
LDI r2, 172
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
