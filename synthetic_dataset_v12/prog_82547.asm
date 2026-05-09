; DESCRIPTION: Draws a yellow line from (255, 241) to (480, 176).
; PLAN: r0=255(x1), r1=241(y1), r2=480(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 241
LDI r2, 480
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
