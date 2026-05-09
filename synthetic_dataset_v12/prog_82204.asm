; DESCRIPTION: Renders a cyan line between points (379, 225) and (245, 227).
; PLAN: r0=379(x1), r1=225(y1), r2=245(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 225
LDI r2, 245
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
