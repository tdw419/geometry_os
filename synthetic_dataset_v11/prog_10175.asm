; DESCRIPTION: Draws a black line from (125, 154) to (60, 177).
; PLAN: r0=125(x1), r1=154(y1), r2=60(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 154
LDI r2, 60
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
