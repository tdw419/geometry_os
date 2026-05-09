; DESCRIPTION: Places a purple line segment connecting (509, 47) to (241, 146).
; PLAN: r0=509(x1), r1=47(y1), r2=241(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 47
LDI r2, 241
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
