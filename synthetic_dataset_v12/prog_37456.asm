; DESCRIPTION: Renders a magenta line between points (75, 207) and (154, 208).
; PLAN: r0=75(x1), r1=207(y1), r2=154(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 207
LDI r2, 154
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
