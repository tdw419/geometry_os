; DESCRIPTION: Renders a black line between points (123, 214) and (171, 103).
; PLAN: r0=123(x1), r1=214(y1), r2=171(x2), r3=103(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 214
LDI r2, 171
LDI r3, 103
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
