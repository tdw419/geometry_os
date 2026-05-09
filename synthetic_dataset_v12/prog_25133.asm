; DESCRIPTION: Places a magenta line segment connecting (493, 0) to (284, 221).
; PLAN: r0=493(x1), r1=0(y1), r2=284(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 0
LDI r2, 284
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
