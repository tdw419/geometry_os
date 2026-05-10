; DESCRIPTION: Renders a magenta line between points (146, 10) and (196, 15).
; PLAN: r0=146(x1), r1=10(y1), r2=196(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 10
LDI r2, 196
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
