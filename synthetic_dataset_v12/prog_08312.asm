; DESCRIPTION: Renders a cyan line between points (373, 234) and (222, 12).
; PLAN: r0=373(x1), r1=234(y1), r2=222(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 234
LDI r2, 222
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
