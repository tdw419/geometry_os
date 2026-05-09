; DESCRIPTION: Draws a red line from (11, 237) to (443, 242).
; PLAN: r0=11(x1), r1=237(y1), r2=443(x2), r3=242(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 237
LDI r2, 443
LDI r3, 242
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
