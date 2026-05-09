; DESCRIPTION: Renders a cyan line between points (213, 110) and (203, 222).
; PLAN: r0=213(x1), r1=110(y1), r2=203(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 110
LDI r2, 203
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
