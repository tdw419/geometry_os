; DESCRIPTION: Draws a cyan line from (73, 11) to (247, 19).
; PLAN: r0=73(x1), r1=11(y1), r2=247(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 11
LDI r2, 247
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
