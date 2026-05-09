; DESCRIPTION: Draws a black line from (68, 180) to (53, 173).
; PLAN: r0=68(x1), r1=180(y1), r2=53(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 180
LDI r2, 53
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
