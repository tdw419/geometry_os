; DESCRIPTION: Renders a red line between points (502, 71) and (320, 4).
; PLAN: r0=502(x1), r1=71(y1), r2=320(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 71
LDI r2, 320
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
