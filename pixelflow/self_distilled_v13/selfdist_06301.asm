; DESCRIPTION: Draws a cyan vertical line down the screen at x=168.
; PLAN: r0x1), r1=3(y1), r2=0(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 3
LDI r2, 0
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
