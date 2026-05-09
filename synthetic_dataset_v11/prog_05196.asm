; DESCRIPTION: Draws a red line from (112, 134) to (242, 193).
; PLAN: r0=112(x1), r1=134(y1), r2=242(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 134
LDI r2, 242
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
