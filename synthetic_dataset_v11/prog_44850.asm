; DESCRIPTION: Renders a magenta line between points (146, 188) and (197, 229).
; PLAN: r0=146(x1), r1=188(y1), r2=197(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 188
LDI r2, 197
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
