; DESCRIPTION: Renders a white line between points (324, 127) and (150, 172).
; PLAN: r0=324(x1), r1=127(y1), r2=150(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 127
LDI r2, 150
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
