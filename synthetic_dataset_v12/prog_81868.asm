; DESCRIPTION: Draws a red line from (318, 215) to (446, 177).
; PLAN: r0=318(x1), r1=215(y1), r2=446(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 215
LDI r2, 446
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
