; DESCRIPTION: Renders a red line between points (253, 194) and (418, 210).
; PLAN: r0=253(x1), r1=194(y1), r2=418(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 194
LDI r2, 418
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
