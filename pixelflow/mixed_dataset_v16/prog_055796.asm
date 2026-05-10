; DESCRIPTION: Renders a red line between points (268, 188) and (105, 236).
; PLAN: r0=268(x1), r1=188(y1), r2=105(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 188
LDI r2, 105
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
