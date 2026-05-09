; DESCRIPTION: Composite: . Then Draws a white circle centered at (86, 137) with radius 79. Then Draws a red line from (133, 124) to (18, 39).
; PLAN: r0=86(x), r1=137(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=133(x1), r1=124(y1), r2=18(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white circle centered at (86, 137) with radius 79.
; PLAN: r0=86(x), r1=137(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 137
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red line from (133, 124) to (18, 39).
; PLAN: r0=133(x1), r1=124(y1), r2=18(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 124
LDI r2, 18
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
