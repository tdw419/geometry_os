; DESCRIPTION: Draws a green line from (228, 122) to (245, 23).
; PLAN: r0=228(x1), r1=122(y1), r2=245(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 122
LDI r2, 245
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
