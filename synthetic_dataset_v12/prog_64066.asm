; DESCRIPTION: Places a yellow line segment connecting (180, 248) to (460, 164).
; PLAN: r0=180(x1), r1=248(y1), r2=460(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 248
LDI r2, 460
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
