; DESCRIPTION: Draws a cyan line from (489, 134) to (415, 233).
; PLAN: r0=489(x1), r1=134(y1), r2=415(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 134
LDI r2, 415
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
