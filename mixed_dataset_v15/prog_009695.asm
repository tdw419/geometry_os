; DESCRIPTION: Renders a magenta line between points (480, 24) and (295, 1).
; PLAN: r0=480(x1), r1=24(y1), r2=295(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 24
LDI r2, 295
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
