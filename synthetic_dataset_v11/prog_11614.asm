; DESCRIPTION: Composite: . Then Draws a orange circle centered at (127, 130) with radius 27. Then Places a white line segment connecting (146, 226) to (56, 27).
; PLAN: r0=127(x), r1=130(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=146(x1), r1=226(y1), r2=56(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (127, 130) with radius 27.
; PLAN: r0=127(x), r1=130(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 130
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white line segment connecting (146, 226) to (56, 27).
; PLAN: r0=146(x1), r1=226(y1), r2=56(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 226
LDI r2, 56
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
