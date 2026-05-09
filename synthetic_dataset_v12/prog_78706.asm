; DESCRIPTION: Renders a cyan line between points (203, 211) and (506, 59).
; PLAN: r0=203(x1), r1=211(y1), r2=506(x2), r3=59(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 211
LDI r2, 506
LDI r3, 59
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
