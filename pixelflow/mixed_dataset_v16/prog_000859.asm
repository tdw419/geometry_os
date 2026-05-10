; DESCRIPTION: Draws a green line from (479, 123) to (242, 232).
; PLAN: r0=479(x1), r1=123(y1), r2=242(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 123
LDI r2, 242
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
