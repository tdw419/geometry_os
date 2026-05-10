; DESCRIPTION: Draws a red line from (242, 72) to (75, 137).
; PLAN: r0=242(x1), r1=72(y1), r2=75(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 72
LDI r2, 75
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
