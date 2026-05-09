; DESCRIPTION: Renders a magenta line between points (499, 108) and (87, 28).
; PLAN: r0=499(x1), r1=108(y1), r2=87(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 108
LDI r2, 87
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
