; DESCRIPTION: Composite: . Then Draws a cyan line from (58, 87) to (127, 110). Then Draws a green circle centered at (173, 92) with radius 15.
; PLAN: r0=58(x1), r1=87(y1), r2=127(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=173(x), r1=92(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan line from (58, 87) to (127, 110).
; PLAN: r0=58(x1), r1=87(y1), r2=127(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 87
LDI r2, 127
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (173, 92) with radius 15.
; PLAN: r0=173(x), r1=92(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 92
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
