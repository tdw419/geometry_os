; DESCRIPTION: Composite: . Then Draws a orange line from (25, 146) to (95, 72). Then Creates a green circular shape at (177, 111) with radius 70.
; PLAN: r0=25(x1), r1=146(y1), r2=95(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=177(x), r1=111(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange line from (25, 146) to (95, 72).
; PLAN: r0=25(x1), r1=146(y1), r2=95(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 146
LDI r2, 95
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green circular shape at (177, 111) with radius 70.
; PLAN: r0=177(x), r1=111(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 111
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
