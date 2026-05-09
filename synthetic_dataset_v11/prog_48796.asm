; DESCRIPTION: Draws a magenta line from (124, 123) to (42, 192).
; PLAN: r0=124(x1), r1=123(y1), r2=42(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 123
LDI r2, 42
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
