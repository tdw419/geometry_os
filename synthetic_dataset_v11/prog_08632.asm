; DESCRIPTION: Draws a cyan line from (111, 112) to (37, 12).
; PLAN: r0=111(x1), r1=112(y1), r2=37(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 112
LDI r2, 37
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
