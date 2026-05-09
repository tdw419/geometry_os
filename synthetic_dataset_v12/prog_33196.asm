; DESCRIPTION: Draws a green line from (62, 245) to (446, 170).
; PLAN: r0=62(x1), r1=245(y1), r2=446(x2), r3=170(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 245
LDI r2, 446
LDI r3, 170
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
