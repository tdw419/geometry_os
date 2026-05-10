; DESCRIPTION: Draws a cyan line from (105, 49) to (380, 38).
; PLAN: r0=105(x1), r1=49(y1), r2=380(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 49
LDI r2, 380
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
