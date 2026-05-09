; DESCRIPTION: Renders a magenta line between points (18, 96) and (193, 215).
; PLAN: r0=18(x1), r1=96(y1), r2=193(x2), r3=215(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 96
LDI r2, 193
LDI r3, 215
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
