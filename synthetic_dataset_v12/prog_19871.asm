; DESCRIPTION: Renders a magenta line between points (433, 202) and (154, 244).
; PLAN: r0=433(x1), r1=202(y1), r2=154(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 202
LDI r2, 154
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
