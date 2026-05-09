; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (152, 156) with radius 77. Then Draws a black line from (193, 97) to (66, 210).
; PLAN: r0=152(x), r1=156(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=193(x1), r1=97(y1), r2=66(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta circular shape at (152, 156) with radius 77.
; PLAN: r0=152(x), r1=156(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 156
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black line from (193, 97) to (66, 210).
; PLAN: r0=193(x1), r1=97(y1), r2=66(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 97
LDI r2, 66
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
