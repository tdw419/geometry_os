; DESCRIPTION: Renders a red line between points (147, 182) and (224, 236).
; PLAN: r0=147(x1), r1=182(y1), r2=224(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 182
LDI r2, 224
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
