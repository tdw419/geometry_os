; DESCRIPTION: Draws a red line from (236, 230) to (198, 117).
; PLAN: r0=236(x1), r1=230(y1), r2=198(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 230
LDI r2, 198
LDI r3, 117
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
