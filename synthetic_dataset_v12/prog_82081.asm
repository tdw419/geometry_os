; DESCRIPTION: Draws a blue line from (373, 90) to (295, 146).
; PLAN: r0=373(x1), r1=90(y1), r2=295(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 90
LDI r2, 295
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
