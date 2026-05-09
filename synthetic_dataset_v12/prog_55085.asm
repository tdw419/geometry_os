; DESCRIPTION: Renders a magenta line between points (277, 48) and (215, 55).
; PLAN: r0=277(x1), r1=48(y1), r2=215(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 48
LDI r2, 215
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
