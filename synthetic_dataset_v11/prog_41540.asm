; DESCRIPTION: Draws a cyan line from (73, 33) to (192, 21).
; PLAN: r0=73(x1), r1=33(y1), r2=192(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 33
LDI r2, 192
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
