; DESCRIPTION: Renders a magenta line between points (90, 99) and (154, 172).
; PLAN: r0=90(x1), r1=99(y1), r2=154(x2), r3=172(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 99
LDI r2, 154
LDI r3, 172
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
