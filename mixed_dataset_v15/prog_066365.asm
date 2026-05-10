; DESCRIPTION: Draws a blue line from (214, 153) to (284, 113).
; PLAN: r0=214(x1), r1=153(y1), r2=284(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 153
LDI r2, 284
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
