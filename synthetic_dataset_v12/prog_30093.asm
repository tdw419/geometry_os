; DESCRIPTION: Draws a white line from (284, 24) to (123, 249).
; PLAN: r0=284(x1), r1=24(y1), r2=123(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 24
LDI r2, 123
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
