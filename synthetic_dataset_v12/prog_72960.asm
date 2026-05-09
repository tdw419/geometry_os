; DESCRIPTION: Renders a cyan line between points (110, 40) and (28, 108).
; PLAN: r0=110(x1), r1=40(y1), r2=28(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 40
LDI r2, 28
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
