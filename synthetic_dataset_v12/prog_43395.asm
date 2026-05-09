; DESCRIPTION: Renders a red line between points (403, 244) and (160, 157).
; PLAN: r0=403(x1), r1=244(y1), r2=160(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 244
LDI r2, 160
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
