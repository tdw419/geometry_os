; DESCRIPTION: Composite: . Then Renders a orange line between points (22, 124) and (177, 83). Then Places a white circle of radius 77 at center (123, 153).
; PLAN: r0=22(x1), r1=124(y1), r2=177(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=123(x), r1=153(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a orange line between points (22, 124) and (177, 83).
; PLAN: r0=22(x1), r1=124(y1), r2=177(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 124
LDI r2, 177
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white circle of radius 77 at center (123, 153).
; PLAN: r0=123(x), r1=153(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 153
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
