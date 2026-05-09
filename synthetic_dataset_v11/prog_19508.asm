; DESCRIPTION: Draws a white line from (59, 79) to (143, 244).
; PLAN: r0=59(x1), r1=79(y1), r2=143(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 79
LDI r2, 143
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
