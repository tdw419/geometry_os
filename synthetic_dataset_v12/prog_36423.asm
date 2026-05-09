; DESCRIPTION: Draws a red line from (127, 188) to (19, 42).
; PLAN: r0=127(x1), r1=188(y1), r2=19(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 188
LDI r2, 19
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
