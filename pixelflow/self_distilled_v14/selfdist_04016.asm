; DESCRIPTION: Draws a red line from (120, 108) to (340, 127).
; PLAN: r0=120(x1), r1=108(y1), r2=340(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 108
LDI r2, 340
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
