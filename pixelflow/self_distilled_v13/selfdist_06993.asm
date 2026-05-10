; DESCRIPTION: Draws a magenta line from (284, 120) to (6, 53).
; PLAN: r0=284(x1), r1=120(y1), r2=6(x2), r3=53(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 120
LDI r2, 6
LDI r3, 53
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
