; DESCRIPTION: Draws a cyan line from (172, 0) to (243, 124).
; PLAN: r0=172(x1), r1=0(y1), r2=243(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 0
LDI r2, 243
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
