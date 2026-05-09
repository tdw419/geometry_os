; DESCRIPTION: Renders a magenta line between points (180, 129) and (53, 223).
; PLAN: r0=180(x1), r1=129(y1), r2=53(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 129
LDI r2, 53
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
