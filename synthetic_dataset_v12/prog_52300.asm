; DESCRIPTION: Draws a cyan line from (441, 139) to (1, 124).
; PLAN: r0=441(x1), r1=139(y1), r2=1(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 139
LDI r2, 1
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
