; DESCRIPTION: Renders a cyan line between points (108, 248) and (203, 218).
; PLAN: r0=108(x1), r1=248(y1), r2=203(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 248
LDI r2, 203
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
