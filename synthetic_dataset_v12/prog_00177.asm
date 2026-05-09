; DESCRIPTION: Draws a blue line from (284, 9) to (214, 64).
; PLAN: r0=284(x1), r1=9(y1), r2=214(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 9
LDI r2, 214
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
