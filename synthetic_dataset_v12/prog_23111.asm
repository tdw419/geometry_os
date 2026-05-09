; DESCRIPTION: Draws a green line from (438, 175) to (393, 166).
; PLAN: r0=438(x1), r1=175(y1), r2=393(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 175
LDI r2, 393
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
