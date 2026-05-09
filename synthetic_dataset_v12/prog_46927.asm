; DESCRIPTION: Renders a magenta line between points (290, 176) and (294, 60).
; PLAN: r0=290(x1), r1=176(y1), r2=294(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 176
LDI r2, 294
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
