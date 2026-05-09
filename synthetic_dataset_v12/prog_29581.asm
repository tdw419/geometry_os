; DESCRIPTION: Renders a red line between points (174, 177) and (106, 213).
; PLAN: r0=174(x1), r1=177(y1), r2=106(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 177
LDI r2, 106
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
