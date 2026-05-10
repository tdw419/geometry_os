; DESCRIPTION: Draws a cyan line from (374, 18) to (111, 67).
; PLAN: r0=374(x1), r1=18(y1), r2=111(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 18
LDI r2, 111
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
