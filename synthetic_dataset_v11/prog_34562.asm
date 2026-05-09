; DESCRIPTION: Renders a red line between points (57, 111) and (69, 111).
; PLAN: r0=57(x1), r1=111(y1), r2=69(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 111
LDI r2, 69
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
