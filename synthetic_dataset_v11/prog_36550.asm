; DESCRIPTION: Draws a black line from (148, 171) to (209, 50).
; PLAN: r0=148(x1), r1=171(y1), r2=209(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 171
LDI r2, 209
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
