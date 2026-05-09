; DESCRIPTION: Renders a magenta line between points (110, 223) and (398, 173).
; PLAN: r0=110(x1), r1=223(y1), r2=398(x2), r3=173(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 223
LDI r2, 398
LDI r3, 173
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
