; DESCRIPTION: Draws a black line from (46, 64) to (167, 167).
; PLAN: r0=46(x1), r1=64(y1), r2=167(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 64
LDI r2, 167
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
