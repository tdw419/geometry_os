; DESCRIPTION: Renders a green line between points (294, 145) and (21, 6).
; PLAN: r0=294(x1), r1=145(y1), r2=21(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 145
LDI r2, 21
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
