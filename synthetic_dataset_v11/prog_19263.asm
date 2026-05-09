; DESCRIPTION: Renders a red line between points (228, 202) and (44, 152).
; PLAN: r0=228(x1), r1=202(y1), r2=44(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 202
LDI r2, 44
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
