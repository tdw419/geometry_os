; DESCRIPTION: Draws a magenta line from (21, 93) to (90, 154).
; PLAN: r0=21(x1), r1=93(y1), r2=90(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 93
LDI r2, 90
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
