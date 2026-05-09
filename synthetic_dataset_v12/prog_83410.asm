; DESCRIPTION: Renders a magenta line between points (277, 152) and (383, 107).
; PLAN: r0=277(x1), r1=152(y1), r2=383(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 152
LDI r2, 383
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
