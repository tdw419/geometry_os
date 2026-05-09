; DESCRIPTION: Renders a yellow line between points (450, 42) and (57, 26).
; PLAN: r0=450(x1), r1=42(y1), r2=57(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 42
LDI r2, 57
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
