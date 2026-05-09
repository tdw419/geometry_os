; DESCRIPTION: Renders a magenta line between points (499, 73) and (344, 1).
; PLAN: r0=499(x1), r1=73(y1), r2=344(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 73
LDI r2, 344
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
