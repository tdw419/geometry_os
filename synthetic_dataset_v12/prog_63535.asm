; DESCRIPTION: Renders a red line between points (356, 236) and (350, 212).
; PLAN: r0=356(x1), r1=236(y1), r2=350(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 236
LDI r2, 350
LDI r3, 212
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
