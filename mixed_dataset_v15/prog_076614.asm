; DESCRIPTION: Draws a yellow line from (243, 149) to (187, 255).
; PLAN: r0=243(x1), r1=149(y1), r2=187(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 149
LDI r2, 187
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
