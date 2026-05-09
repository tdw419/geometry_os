; DESCRIPTION: Draws a red line from (61, 112) to (255, 236).
; PLAN: r0=61(x1), r1=112(y1), r2=255(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 112
LDI r2, 255
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
