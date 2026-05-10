; DESCRIPTION: Draws a cyan line from (451, 245) to (178, 12).
; PLAN: r0=451(x1), r1=245(y1), r2=178(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 245
LDI r2, 178
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
