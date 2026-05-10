; DESCRIPTION: Draws a cyan line from (279, 7) to (26, 43).
; PLAN: r0=279(x1), r1=7(y1), r2=26(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 7
LDI r2, 26
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
