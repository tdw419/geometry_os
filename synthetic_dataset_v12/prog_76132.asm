; DESCRIPTION: Draws a red line from (400, 124) to (367, 244).
; PLAN: r0=400(x1), r1=124(y1), r2=367(x2), r3=244(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 124
LDI r2, 367
LDI r3, 244
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
