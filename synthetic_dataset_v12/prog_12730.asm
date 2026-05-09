; DESCRIPTION: Draws a green line from (291, 240) to (281, 102).
; PLAN: r0=291(x1), r1=240(y1), r2=281(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 240
LDI r2, 281
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
