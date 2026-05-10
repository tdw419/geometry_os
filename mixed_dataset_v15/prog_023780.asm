; DESCRIPTION: Renders a purple line between points (487, 205) and (301, 86).
; PLAN: r0=487(x1), r1=205(y1), r2=301(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 205
LDI r2, 301
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
