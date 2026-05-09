; DESCRIPTION: Renders a magenta line between points (32, 132) and (220, 16).
; PLAN: r0=32(x1), r1=132(y1), r2=220(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 132
LDI r2, 220
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
