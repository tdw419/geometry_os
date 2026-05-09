; DESCRIPTION: Draws a cyan line from (71, 1) to (77, 152).
; PLAN: r0=71(x1), r1=1(y1), r2=77(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 1
LDI r2, 77
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
