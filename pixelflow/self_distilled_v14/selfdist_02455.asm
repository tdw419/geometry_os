; DESCRIPTION: Draws a cyan vertical line down the screen at x=180.
; PLAN: r0x1), r1=1(y1), r2=0(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 1
LDI r2, 0
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
