; DESCRIPTION: Draws a black line from (38, 59) to (467, 126).
; PLAN: r0=38(x1), r1=59(y1), r2=467(x2), r3=126(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 59
LDI r2, 467
LDI r3, 126
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
