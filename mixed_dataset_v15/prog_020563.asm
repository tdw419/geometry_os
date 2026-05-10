; DESCRIPTION: Renders a orange line between points (186, 242) and (327, 82).
; PLAN: r0=186(x1), r1=242(y1), r2=327(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 242
LDI r2, 327
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
