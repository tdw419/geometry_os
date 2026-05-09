; DESCRIPTION: Draws a red line from (210, 254) to (229, 117).
; PLAN: r0=210(x1), r1=254(y1), r2=229(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 254
LDI r2, 229
LDI r3, 117
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
