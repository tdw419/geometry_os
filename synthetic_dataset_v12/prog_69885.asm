; DESCRIPTION: Draws a white line from (245, 121) to (191, 215).
; PLAN: r0=245(x1), r1=121(y1), r2=191(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 121
LDI r2, 191
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
