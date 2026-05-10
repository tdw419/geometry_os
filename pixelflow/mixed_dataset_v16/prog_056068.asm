; DESCRIPTION: Draws a magenta line from (422, 159) to (39, 236).
; PLAN: r0=422(x1), r1=159(y1), r2=39(x2), r3=236(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 159
LDI r2, 39
LDI r3, 236
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
