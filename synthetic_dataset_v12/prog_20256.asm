; DESCRIPTION: Draws a white line from (438, 206) to (480, 163).
; PLAN: r0=438(x1), r1=206(y1), r2=480(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 206
LDI r2, 480
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
