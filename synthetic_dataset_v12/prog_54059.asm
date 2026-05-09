; DESCRIPTION: Renders a cyan line between points (97, 100) and (54, 239).
; PLAN: r0=97(x1), r1=100(y1), r2=54(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 100
LDI r2, 54
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
