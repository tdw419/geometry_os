; DESCRIPTION: Draws a white line from (387, 169) to (284, 71).
; PLAN: r0=387(x1), r1=169(y1), r2=284(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 169
LDI r2, 284
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
