; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (82, 96) with radius 43. Then Draws a white line from (244, 90) to (60, 106).
; PLAN: r0=82(x), r1=96(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=244(x1), r1=90(y1), r2=60(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta circular shape at (82, 96) with radius 43.
; PLAN: r0=82(x), r1=96(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 96
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white line from (244, 90) to (60, 106).
; PLAN: r0=244(x1), r1=90(y1), r2=60(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 90
LDI r2, 60
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
