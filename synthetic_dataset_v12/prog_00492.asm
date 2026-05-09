; DESCRIPTION: Draws a cyan line from (199, 29) to (404, 47).
; PLAN: r0=199(x1), r1=29(y1), r2=404(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 29
LDI r2, 404
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
