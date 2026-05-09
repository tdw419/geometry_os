; DESCRIPTION: Draws a green line from (496, 243) to (39, 242).
; PLAN: r0=496(x1), r1=243(y1), r2=39(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 243
LDI r2, 39
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
