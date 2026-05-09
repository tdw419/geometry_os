; DESCRIPTION: Renders a cyan line between points (12, 43) and (218, 13).
; PLAN: r0=12(x1), r1=43(y1), r2=218(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 43
LDI r2, 218
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
