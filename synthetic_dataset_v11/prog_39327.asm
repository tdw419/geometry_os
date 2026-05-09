; DESCRIPTION: Renders a green line between points (228, 152) and (201, 83).
; PLAN: r0=228(x1), r1=152(y1), r2=201(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 152
LDI r2, 201
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
