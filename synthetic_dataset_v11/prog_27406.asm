; DESCRIPTION: Draws a yellow line from (110, 90) to (143, 42).
; PLAN: r0=110(x1), r1=90(y1), r2=143(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 90
LDI r2, 143
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
