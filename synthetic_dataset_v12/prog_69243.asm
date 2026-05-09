; DESCRIPTION: Draws a green line from (196, 98) to (405, 17).
; PLAN: r0=196(x1), r1=98(y1), r2=405(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 98
LDI r2, 405
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
