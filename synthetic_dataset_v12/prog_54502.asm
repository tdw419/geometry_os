; DESCRIPTION: Draws a green line from (495, 50) to (77, 236).
; PLAN: r0=495(x1), r1=50(y1), r2=77(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 50
LDI r2, 77
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
