; DESCRIPTION: Renders a red line between points (37, 206) and (72, 209).
; PLAN: r0=37(x1), r1=206(y1), r2=72(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 206
LDI r2, 72
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
