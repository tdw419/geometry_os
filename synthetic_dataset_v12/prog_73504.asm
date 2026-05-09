; DESCRIPTION: Draws a red line from (127, 220) to (480, 54).
; PLAN: r0=127(x1), r1=220(y1), r2=480(x2), r3=54(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 220
LDI r2, 480
LDI r3, 54
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
