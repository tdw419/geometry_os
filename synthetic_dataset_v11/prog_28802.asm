; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (85, 150) with radius 80. Then Draws a magenta line from (210, 220) to (254, 240).
; PLAN: r0=85(x), r1=150(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=210(x1), r1=220(y1), r2=254(x2), r3=240(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan circle centered at (85, 150) with radius 80.
; PLAN: r0=85(x), r1=150(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 150
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta line from (210, 220) to (254, 240).
; PLAN: r0=210(x1), r1=220(y1), r2=254(x2), r3=240(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 220
LDI r2, 254
LDI r3, 240
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
