; DESCRIPTION: Renders a magenta line between points (364, 127) and (443, 107).
; PLAN: r0=364(x1), r1=127(y1), r2=443(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 127
LDI r2, 443
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
