; DESCRIPTION: Renders a magenta line between points (360, 50) and (268, 242).
; PLAN: r0=360(x1), r1=50(y1), r2=268(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 50
LDI r2, 268
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
