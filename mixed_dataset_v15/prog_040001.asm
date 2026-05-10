; DESCRIPTION: Draws a black line from (34, 27) to (374, 113).
; PLAN: r0=34(x1), r1=27(y1), r2=374(x2), r3=113(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 27
LDI r2, 374
LDI r3, 113
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
