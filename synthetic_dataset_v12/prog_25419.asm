; DESCRIPTION: Draws a black line from (103, 219) to (187, 126).
; PLAN: r0=103(x1), r1=219(y1), r2=187(x2), r3=126(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 219
LDI r2, 187
LDI r3, 126
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
