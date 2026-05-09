; DESCRIPTION: Draws a red line from (299, 57) to (392, 99).
; PLAN: r0=299(x1), r1=57(y1), r2=392(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 57
LDI r2, 392
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
