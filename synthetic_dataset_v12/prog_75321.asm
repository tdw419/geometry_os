; DESCRIPTION: Draws a cyan line from (303, 177) to (115, 203).
; PLAN: r0=303(x1), r1=177(y1), r2=115(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 177
LDI r2, 115
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
