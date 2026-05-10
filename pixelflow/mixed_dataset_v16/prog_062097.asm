; DESCRIPTION: Draws a cyan line from (279, 153) to (130, 23).
; PLAN: r0=279(x1), r1=153(y1), r2=130(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 153
LDI r2, 130
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
