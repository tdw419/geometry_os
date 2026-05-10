; DESCRIPTION: Draws a cyan line from (182, 61) to (315, 13).
; PLAN: r0=182(x1), r1=61(y1), r2=315(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 61
LDI r2, 315
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
