; DESCRIPTION: Draws a red line from (319, 213) to (369, 174).
; PLAN: r0=319(x1), r1=213(y1), r2=369(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 213
LDI r2, 369
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
