; DESCRIPTION: Draws a yellow line from (152, 38) to (209, 174).
; PLAN: r0=152(x1), r1=38(y1), r2=209(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 38
LDI r2, 209
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
