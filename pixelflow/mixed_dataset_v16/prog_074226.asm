; DESCRIPTION: Places a black line segment connecting (284, 249) to (284, 138).
; PLAN: r0=284(x1), r1=249(y1), r2=284(x2), r3=138(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 249
LDI r2, 284
LDI r3, 138
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
