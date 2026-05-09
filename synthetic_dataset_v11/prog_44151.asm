; DESCRIPTION: Draws a magenta line from (206, 182) to (209, 67).
; PLAN: r0=206(x1), r1=182(y1), r2=209(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 182
LDI r2, 209
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
