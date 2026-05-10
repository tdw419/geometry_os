; DESCRIPTION: Draws a green line from (307, 101) to (298, 46).
; PLAN: r0=307(x1), r1=101(y1), r2=298(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 101
LDI r2, 298
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
