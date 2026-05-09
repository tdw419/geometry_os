; DESCRIPTION: Draws a black line from (209, 126) to (131, 210).
; PLAN: r0=209(x1), r1=126(y1), r2=131(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 126
LDI r2, 131
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
