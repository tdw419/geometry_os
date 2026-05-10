; DESCRIPTION: Draws a yellow line from (405, 14) to (178, 82).
; PLAN: r0=405(x1), r1=14(y1), r2=178(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 14
LDI r2, 178
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
