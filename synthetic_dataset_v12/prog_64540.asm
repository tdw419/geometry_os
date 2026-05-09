; DESCRIPTION: Draws a black line from (167, 124) to (374, 38).
; PLAN: r0=167(x1), r1=124(y1), r2=374(x2), r3=38(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 124
LDI r2, 374
LDI r3, 38
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
