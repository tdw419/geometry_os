; DESCRIPTION: Draws a magenta line from (126, 71) to (76, 192).
; PLAN: r0=126(x1), r1=71(y1), r2=76(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 71
LDI r2, 76
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
