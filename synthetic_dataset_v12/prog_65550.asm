; DESCRIPTION: Draws a magenta line from (335, 67) to (446, 215).
; PLAN: r0=335(x1), r1=67(y1), r2=446(x2), r3=215(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 67
LDI r2, 446
LDI r3, 215
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
