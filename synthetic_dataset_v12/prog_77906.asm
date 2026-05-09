; DESCRIPTION: Draws a cyan line from (303, 178) to (77, 70).
; PLAN: r0=303(x1), r1=178(y1), r2=77(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 178
LDI r2, 77
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
