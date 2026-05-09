; DESCRIPTION: Draws a red line from (44, 176) to (422, 27).
; PLAN: r0=44(x1), r1=176(y1), r2=422(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 176
LDI r2, 422
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
