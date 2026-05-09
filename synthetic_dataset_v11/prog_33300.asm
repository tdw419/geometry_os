; DESCRIPTION: Draws a black line from (180, 148) to (69, 242).
; PLAN: r0=180(x1), r1=148(y1), r2=69(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 148
LDI r2, 69
LDI r3, 242
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
