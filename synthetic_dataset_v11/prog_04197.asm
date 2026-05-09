; DESCRIPTION: Composite: . Then Draws a black line from (44, 125) to (228, 235). Then Renders a red disk with center (129, 168) and radius 19.
; PLAN: r0=44(x1), r1=125(y1), r2=228(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=129(x), r1=168(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a black line from (44, 125) to (228, 235).
; PLAN: r0=44(x1), r1=125(y1), r2=228(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 125
LDI r2, 228
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (129, 168) and radius 19.
; PLAN: r0=129(x), r1=168(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 168
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
