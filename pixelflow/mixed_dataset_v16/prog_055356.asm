; DESCRIPTION: Draws a green line from (69, 198) to (209, 107).
; PLAN: r0=69(x1), r1=198(y1), r2=209(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 198
LDI r2, 209
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
