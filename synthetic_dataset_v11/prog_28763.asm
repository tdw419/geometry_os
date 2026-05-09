; DESCRIPTION: Draws a white line from (39, 248) to (63, 134).
; PLAN: r0=39(x1), r1=248(y1), r2=63(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 248
LDI r2, 63
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
