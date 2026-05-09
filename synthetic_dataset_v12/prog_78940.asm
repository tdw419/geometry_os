; DESCRIPTION: Draws a black line from (354, 69) to (196, 50).
; PLAN: r0=354(x1), r1=69(y1), r2=196(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 69
LDI r2, 196
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
