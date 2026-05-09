; DESCRIPTION: Places a magenta line segment connecting (225, 180) to (42, 55).
; PLAN: r0=225(x1), r1=180(y1), r2=42(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 180
LDI r2, 42
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
