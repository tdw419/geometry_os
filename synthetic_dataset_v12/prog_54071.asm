; DESCRIPTION: Draws a cyan line from (413, 104) to (208, 180).
; PLAN: r0=413(x1), r1=104(y1), r2=208(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 104
LDI r2, 208
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
