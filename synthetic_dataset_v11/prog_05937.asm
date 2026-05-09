; DESCRIPTION: Composite: . Then Renders a black disk with center (143, 186) and radius 18. Then Places a cyan line segment connecting (112, 60) to (108, 180).
; PLAN: r0=143(x), r1=186(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=112(x1), r1=60(y1), r2=108(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (143, 186) and radius 18.
; PLAN: r0=143(x), r1=186(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 186
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan line segment connecting (112, 60) to (108, 180).
; PLAN: r0=112(x1), r1=60(y1), r2=108(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 60
LDI r2, 108
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
