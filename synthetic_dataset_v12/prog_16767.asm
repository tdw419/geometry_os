; DESCRIPTION: Renders a red line between points (202, 154) and (268, 141).
; PLAN: r0=202(x1), r1=154(y1), r2=268(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 154
LDI r2, 268
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
