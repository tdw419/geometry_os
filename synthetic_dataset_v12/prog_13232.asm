; DESCRIPTION: Places a magenta line segment connecting (33, 203) to (213, 215).
; PLAN: r0=33(x1), r1=203(y1), r2=213(x2), r3=215(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 203
LDI r2, 213
LDI r3, 215
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
