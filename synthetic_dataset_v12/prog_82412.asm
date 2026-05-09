; DESCRIPTION: Draws a red line from (48, 47) to (207, 200).
; PLAN: r0=48(x1), r1=47(y1), r2=207(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 47
LDI r2, 207
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
