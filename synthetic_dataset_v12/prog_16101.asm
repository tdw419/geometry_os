; DESCRIPTION: Renders a red line between points (292, 242) and (271, 172).
; PLAN: r0=292(x1), r1=242(y1), r2=271(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 242
LDI r2, 271
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
