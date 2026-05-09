; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (121, 82) with radius 78. Then Places a green line segment connecting (13, 54) to (39, 1).
; PLAN: r0=121(x), r1=82(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=13(x1), r1=54(y1), r2=39(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan circle centered at (121, 82) with radius 78.
; PLAN: r0=121(x), r1=82(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 82
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green line segment connecting (13, 54) to (39, 1).
; PLAN: r0=13(x1), r1=54(y1), r2=39(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 54
LDI r2, 39
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
