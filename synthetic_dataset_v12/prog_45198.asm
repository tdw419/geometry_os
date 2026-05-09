; DESCRIPTION: Draws a red line from (365, 14) to (328, 221).
; PLAN: r0=365(x1), r1=14(y1), r2=328(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 14
LDI r2, 328
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
