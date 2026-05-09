; DESCRIPTION: Composite: . Then Creates a orange circular shape at (91, 91) with radius 79. Then Draws a red line from (206, 85) to (88, 55).
; PLAN: r0=91(x), r1=91(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=206(x1), r1=85(y1), r2=88(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange circular shape at (91, 91) with radius 79.
; PLAN: r0=91(x), r1=91(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 91
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red line from (206, 85) to (88, 55).
; PLAN: r0=206(x1), r1=85(y1), r2=88(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 85
LDI r2, 88
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
