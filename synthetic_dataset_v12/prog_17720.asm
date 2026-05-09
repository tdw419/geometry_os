; DESCRIPTION: Renders a red line between points (263, 124) and (224, 58).
; PLAN: r0=263(x1), r1=124(y1), r2=224(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 124
LDI r2, 224
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
