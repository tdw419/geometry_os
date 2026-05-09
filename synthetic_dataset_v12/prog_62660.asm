; DESCRIPTION: Renders a magenta line between points (264, 55) and (121, 111).
; PLAN: r0=264(x1), r1=55(y1), r2=121(x2), r3=111(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 55
LDI r2, 121
LDI r3, 111
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
