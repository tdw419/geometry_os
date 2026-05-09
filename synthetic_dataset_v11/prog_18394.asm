; DESCRIPTION: Draws a cyan line from (43, 45) to (57, 153).
; PLAN: r0=43(x1), r1=45(y1), r2=57(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 45
LDI r2, 57
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
