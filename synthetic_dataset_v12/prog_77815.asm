; DESCRIPTION: Renders a magenta line between points (305, 1) and (286, 32).
; PLAN: r0=305(x1), r1=1(y1), r2=286(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 1
LDI r2, 286
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
