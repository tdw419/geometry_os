; DESCRIPTION: Renders a magenta line between points (455, 1) and (398, 134).
; PLAN: r0=455(x1), r1=1(y1), r2=398(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 1
LDI r2, 398
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
