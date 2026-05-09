; DESCRIPTION: Composite: . Then Renders a white line between points (64, 142) and (113, 114). Then Draws a green circle centered at (146, 108) with radius 77.
; PLAN: r0=64(x1), r1=142(y1), r2=113(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=146(x), r1=108(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white line between points (64, 142) and (113, 114).
; PLAN: r0=64(x1), r1=142(y1), r2=113(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 142
LDI r2, 113
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (146, 108) with radius 77.
; PLAN: r0=146(x), r1=108(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 108
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
