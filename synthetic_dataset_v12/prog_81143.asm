; DESCRIPTION: Draws a orange line from (502, 4) to (70, 231).
; PLAN: r0=502(x1), r1=4(y1), r2=70(x2), r3=231(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 4
LDI r2, 70
LDI r3, 231
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
