; DESCRIPTION: Draws a red line from (439, 111) to (302, 221).
; PLAN: r0=439(x1), r1=111(y1), r2=302(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 111
LDI r2, 302
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
