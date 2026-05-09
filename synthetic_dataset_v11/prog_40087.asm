; DESCRIPTION: Draws a green line from (240, 98) to (23, 8).
; PLAN: r0=240(x1), r1=98(y1), r2=23(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 98
LDI r2, 23
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
