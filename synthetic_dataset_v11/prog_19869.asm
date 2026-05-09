; DESCRIPTION: Renders a red line between points (171, 100) and (138, 111).
; PLAN: r0=171(x1), r1=100(y1), r2=138(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 100
LDI r2, 138
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
