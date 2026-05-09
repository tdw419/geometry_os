; DESCRIPTION: Renders a magenta line between points (494, 108) and (386, 7).
; PLAN: r0=494(x1), r1=108(y1), r2=386(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 108
LDI r2, 386
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
