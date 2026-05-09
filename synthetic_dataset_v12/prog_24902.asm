; DESCRIPTION: Renders a red line between points (305, 242) and (426, 184).
; PLAN: r0=305(x1), r1=242(y1), r2=426(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 242
LDI r2, 426
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
