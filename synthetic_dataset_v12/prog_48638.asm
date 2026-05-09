; DESCRIPTION: Renders a green line between points (251, 248) and (294, 5).
; PLAN: r0=251(x1), r1=248(y1), r2=294(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 248
LDI r2, 294
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
