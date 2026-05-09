; DESCRIPTION: Draws a yellow line from (59, 229) to (284, 217).
; PLAN: r0=59(x1), r1=229(y1), r2=284(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 229
LDI r2, 284
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
