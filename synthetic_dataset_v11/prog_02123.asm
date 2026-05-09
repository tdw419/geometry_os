; DESCRIPTION: Renders a magenta line between points (75, 16) and (32, 250).
; PLAN: r0=75(x1), r1=16(y1), r2=32(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 16
LDI r2, 32
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
