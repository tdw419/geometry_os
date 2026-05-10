; DESCRIPTION: Draws a red line from (371, 145) to (214, 213).
; PLAN: r0=371(x1), r1=145(y1), r2=214(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 145
LDI r2, 214
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
