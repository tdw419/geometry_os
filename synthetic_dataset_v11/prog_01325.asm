; DESCRIPTION: Draws a cyan line from (71, 46) to (122, 15).
; PLAN: r0=71(x1), r1=46(y1), r2=122(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 46
LDI r2, 122
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
