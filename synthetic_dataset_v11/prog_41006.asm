; DESCRIPTION: Draws a magenta line from (71, 67) to (50, 186).
; PLAN: r0=71(x1), r1=67(y1), r2=50(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 67
LDI r2, 50
LDI r3, 186
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
