; DESCRIPTION: Composite: . Then Draws a magenta line from (154, 211) to (184, 17). Then Draws a green circle centered at (185, 67) with radius 59.
; PLAN: r0=154(x1), r1=211(y1), r2=184(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=185(x), r1=67(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta line from (154, 211) to (184, 17).
; PLAN: r0=154(x1), r1=211(y1), r2=184(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 211
LDI r2, 184
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (185, 67) with radius 59.
; PLAN: r0=185(x), r1=67(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 67
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
