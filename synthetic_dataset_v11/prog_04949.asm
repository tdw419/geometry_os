; DESCRIPTION: Draws a magenta line from (154, 143) to (29, 192).
; PLAN: r0=154(x1), r1=143(y1), r2=29(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 143
LDI r2, 29
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
