; DESCRIPTION: Draws a cyan line from (4, 108) to (236, 92).
; PLAN: r0=4(x1), r1=108(y1), r2=236(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 108
LDI r2, 236
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
