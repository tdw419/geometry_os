; DESCRIPTION: Renders a magenta line between points (487, 240) and (469, 38).
; PLAN: r0=487(x1), r1=240(y1), r2=469(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 240
LDI r2, 469
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
