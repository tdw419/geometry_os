; DESCRIPTION: Draws a red line from (177, 226) to (70, 27).
; PLAN: r0=177(x1), r1=226(y1), r2=70(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 226
LDI r2, 70
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
