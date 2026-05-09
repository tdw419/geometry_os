; DESCRIPTION: Renders a magenta line between points (344, 53) and (394, 6).
; PLAN: r0=344(x1), r1=53(y1), r2=394(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 53
LDI r2, 394
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
