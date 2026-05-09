; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (62, 150) with radius 51. Then Places a red line segment connecting (111, 63) to (140, 139).
; PLAN: r0=62(x), r1=150(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=111(x1), r1=63(y1), r2=140(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan circle centered at (62, 150) with radius 51.
; PLAN: r0=62(x), r1=150(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 150
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red line segment connecting (111, 63) to (140, 139).
; PLAN: r0=111(x1), r1=63(y1), r2=140(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 63
LDI r2, 140
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
