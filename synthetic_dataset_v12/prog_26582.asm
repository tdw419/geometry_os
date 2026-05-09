; DESCRIPTION: Draws a green line from (208, 138) to (288, 198).
; PLAN: r0=208(x1), r1=138(y1), r2=288(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 138
LDI r2, 288
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
