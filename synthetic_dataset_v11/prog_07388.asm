; DESCRIPTION: Renders a magenta line between points (209, 186) and (167, 248).
; PLAN: r0=209(x1), r1=186(y1), r2=167(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 186
LDI r2, 167
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
