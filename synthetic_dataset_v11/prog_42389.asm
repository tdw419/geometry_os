; DESCRIPTION: Draws a cyan line from (98, 229) to (138, 124).
; PLAN: r0=98(x1), r1=229(y1), r2=138(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 229
LDI r2, 138
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
