; DESCRIPTION: Draws a white line from (137, 215) to (199, 82).
; PLAN: r0=137(x1), r1=215(y1), r2=199(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 215
LDI r2, 199
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
