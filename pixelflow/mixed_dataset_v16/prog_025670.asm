; DESCRIPTION: Renders a green line between points (458, 31) and (183, 143).
; PLAN: r0=458(x1), r1=31(y1), r2=183(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 31
LDI r2, 183
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
