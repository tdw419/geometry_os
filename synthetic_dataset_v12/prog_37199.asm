; DESCRIPTION: Renders a magenta line between points (352, 34) and (117, 178).
; PLAN: r0=352(x1), r1=34(y1), r2=117(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 34
LDI r2, 117
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
