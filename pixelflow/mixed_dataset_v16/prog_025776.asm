; DESCRIPTION: Draws a white line from (291, 122) to (28, 126).
; PLAN: r0=291(x1), r1=122(y1), r2=28(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 122
LDI r2, 28
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
