; DESCRIPTION: Composite: . Then Draws a white line from (9, 135) to (16, 212). Then Creates a magenta circular shape at (189, 82) with radius 60.
; PLAN: r0=9(x1), r1=135(y1), r2=16(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=189(x), r1=82(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white line from (9, 135) to (16, 212).
; PLAN: r0=9(x1), r1=135(y1), r2=16(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 135
LDI r2, 16
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta circular shape at (189, 82) with radius 60.
; PLAN: r0=189(x), r1=82(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 82
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
