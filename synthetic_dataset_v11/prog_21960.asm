; DESCRIPTION: Renders a magenta line between points (79, 204) and (156, 146).
; PLAN: r0=79(x1), r1=204(y1), r2=156(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 204
LDI r2, 156
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
