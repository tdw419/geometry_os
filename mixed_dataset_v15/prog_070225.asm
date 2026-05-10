; DESCRIPTION: Draws a blue line from (271, 207) to (387, 103).
; PLAN: r0=271(x1), r1=207(y1), r2=387(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 207
LDI r2, 387
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
