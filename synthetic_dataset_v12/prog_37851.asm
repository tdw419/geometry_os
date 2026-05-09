; DESCRIPTION: Draws a green line from (23, 209) to (55, 231).
; PLAN: r0=23(x1), r1=209(y1), r2=55(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 209
LDI r2, 55
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
