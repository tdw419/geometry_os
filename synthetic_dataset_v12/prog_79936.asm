; DESCRIPTION: Renders a magenta line between points (410, 121) and (464, 49).
; PLAN: r0=410(x1), r1=121(y1), r2=464(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 121
LDI r2, 464
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
