; DESCRIPTION: Renders a magenta line between points (206, 31) and (254, 187).
; PLAN: r0=206(x1), r1=31(y1), r2=254(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 31
LDI r2, 254
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
