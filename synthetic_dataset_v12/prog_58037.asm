; DESCRIPTION: Renders a yellow line between points (180, 126) and (465, 123).
; PLAN: r0=180(x1), r1=126(y1), r2=465(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 126
LDI r2, 465
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
