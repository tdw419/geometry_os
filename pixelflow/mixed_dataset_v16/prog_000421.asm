; DESCRIPTION: Draws a red line from (424, 39) to (433, 192).
; PLAN: r0=424(x1), r1=39(y1), r2=433(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 39
LDI r2, 433
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
