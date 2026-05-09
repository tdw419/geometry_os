; DESCRIPTION: Draws a black line from (241, 67) to (81, 215).
; PLAN: r0=241(x1), r1=67(y1), r2=81(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 67
LDI r2, 81
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
