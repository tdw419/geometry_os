; DESCRIPTION: Draws a cyan line from (124, 127) to (255, 158).
; PLAN: r0=124(x1), r1=127(y1), r2=255(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 127
LDI r2, 255
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
