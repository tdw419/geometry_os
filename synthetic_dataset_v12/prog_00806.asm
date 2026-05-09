; DESCRIPTION: Draws a magenta line from (28, 239) to (72, 197).
; PLAN: r0=28(x1), r1=239(y1), r2=72(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 239
LDI r2, 72
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
