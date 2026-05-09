; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (181, 222). Then Renders a blue line between points (244, 40) and (74, 240).
; PLAN: r0=181(x), r1=222(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=244(x1), r1=40(y1), r2=74(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (181, 222).
; PLAN: r0=181(x), r1=222(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 181
LDI r1, 222
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (244, 40) and (74, 240).
; PLAN: r0=244(x1), r1=40(y1), r2=74(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 40
LDI r2, 74
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
