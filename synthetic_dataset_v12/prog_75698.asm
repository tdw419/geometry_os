; DESCRIPTION: Draws a green line from (116, 127) to (152, 29).
; PLAN: r0=116(x1), r1=127(y1), r2=152(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 127
LDI r2, 152
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
