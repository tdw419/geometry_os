; DESCRIPTION: Renders a red line between points (497, 224) and (290, 59).
; PLAN: r0=497(x1), r1=224(y1), r2=290(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 224
LDI r2, 290
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
