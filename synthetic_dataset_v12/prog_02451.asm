; DESCRIPTION: Renders a red line between points (440, 18) and (400, 174).
; PLAN: r0=440(x1), r1=18(y1), r2=400(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 18
LDI r2, 400
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
