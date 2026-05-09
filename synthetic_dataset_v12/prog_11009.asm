; DESCRIPTION: Renders a red line between points (275, 146) and (482, 66).
; PLAN: r0=275(x1), r1=146(y1), r2=482(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 146
LDI r2, 482
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
