; DESCRIPTION: Draws a magenta line from (488, 67) to (224, 94).
; PLAN: r0=488(x1), r1=67(y1), r2=224(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 67
LDI r2, 224
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
