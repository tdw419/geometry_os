; DESCRIPTION: Draws a red line from (69, 198) to (442, 239).
; PLAN: r0=69(x1), r1=198(y1), r2=442(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 198
LDI r2, 442
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
