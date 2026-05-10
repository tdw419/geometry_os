; DESCRIPTION: Draws a green line from (454, 2) to (479, 8).
; PLAN: r0=454(x1), r1=2(y1), r2=479(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 2
LDI r2, 479
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
