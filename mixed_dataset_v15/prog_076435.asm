; DESCRIPTION: Draws a cyan line from (145, 49) to (57, 46).
; PLAN: r0=145(x1), r1=49(y1), r2=57(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 49
LDI r2, 57
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
