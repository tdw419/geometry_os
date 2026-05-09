; DESCRIPTION: Draws a red line from (130, 31) to (48, 55).
; PLAN: r0=130(x1), r1=31(y1), r2=48(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 31
LDI r2, 48
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
