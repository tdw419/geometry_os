; DESCRIPTION: Renders a yellow line between points (295, 213) and (217, 110).
; PLAN: r0=295(x1), r1=213(y1), r2=217(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 213
LDI r2, 217
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
