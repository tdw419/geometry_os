; DESCRIPTION: Draws a magenta line from (504, 129) to (95, 142).
; PLAN: r0=504(x1), r1=129(y1), r2=95(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 129
LDI r2, 95
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
