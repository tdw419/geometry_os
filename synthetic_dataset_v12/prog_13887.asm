; DESCRIPTION: Draws a green line from (218, 143) to (126, 250).
; PLAN: r0=218(x1), r1=143(y1), r2=126(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 143
LDI r2, 126
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
