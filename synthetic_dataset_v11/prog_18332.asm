; DESCRIPTION: Draws a cyan line from (20, 44) to (182, 9).
; PLAN: r0=20(x1), r1=44(y1), r2=182(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 44
LDI r2, 182
LDI r3, 9
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
