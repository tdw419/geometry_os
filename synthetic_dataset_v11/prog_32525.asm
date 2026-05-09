; DESCRIPTION: Renders a magenta line between points (1, 132) and (255, 113).
; PLAN: r0=1(x1), r1=132(y1), r2=255(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 132
LDI r2, 255
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
