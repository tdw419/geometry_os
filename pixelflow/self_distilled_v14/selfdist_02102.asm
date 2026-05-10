; DESCRIPTION: Draws a blue line from (284, 155) to (386, 56).
; PLAN: r0=284(x1), r1=155(y1), r2=386(x2), r3=56(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 155
LDI r2, 386
LDI r3, 56
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
