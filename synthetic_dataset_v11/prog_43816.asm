; DESCRIPTION: Composite: . Then Draws a yellow line from (18, 200) to (152, 174). Then Creates a magenta circular shape at (61, 157) with radius 48.
; PLAN: r0=18(x1), r1=200(y1), r2=152(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=61(x), r1=157(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a yellow line from (18, 200) to (152, 174).
; PLAN: r0=18(x1), r1=200(y1), r2=152(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 200
LDI r2, 152
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta circular shape at (61, 157) with radius 48.
; PLAN: r0=61(x), r1=157(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 157
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
