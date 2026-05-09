; DESCRIPTION: Draws a white line from (405, 231) to (127, 133).
; PLAN: r0=405(x1), r1=231(y1), r2=127(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 231
LDI r2, 127
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
