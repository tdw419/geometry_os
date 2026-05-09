; DESCRIPTION: Draws a cyan line from (19, 205) to (353, 114).
; PLAN: r0=19(x1), r1=205(y1), r2=353(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 205
LDI r2, 353
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
