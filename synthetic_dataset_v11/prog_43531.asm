; DESCRIPTION: Renders a cyan line between points (218, 175) and (8, 137).
; PLAN: r0=218(x1), r1=175(y1), r2=8(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 175
LDI r2, 8
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
