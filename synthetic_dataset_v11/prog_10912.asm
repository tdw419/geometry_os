; DESCRIPTION: Composite: . Then Places a green circle of radius 77 at center (112, 132). Then Places a cyan line segment connecting (171, 193) to (132, 117).
; PLAN: r0=112(x), r1=132(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=171(x1), r1=193(y1), r2=132(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green circle of radius 77 at center (112, 132).
; PLAN: r0=112(x), r1=132(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 132
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan line segment connecting (171, 193) to (132, 117).
; PLAN: r0=171(x1), r1=193(y1), r2=132(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 193
LDI r2, 132
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
