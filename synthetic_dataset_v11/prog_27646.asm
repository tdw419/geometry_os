; DESCRIPTION: Renders a magenta line between points (75, 27) and (107, 209).
; PLAN: r0=75(x1), r1=27(y1), r2=107(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 27
LDI r2, 107
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
