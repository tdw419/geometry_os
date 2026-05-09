; DESCRIPTION: Renders a white line between points (264, 42) and (188, 150).
; PLAN: r0=264(x1), r1=42(y1), r2=188(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 42
LDI r2, 188
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
