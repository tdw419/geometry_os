; DESCRIPTION: Draws a cyan line from (55, 74) to (202, 20).
; PLAN: r0=55(x1), r1=74(y1), r2=202(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 74
LDI r2, 202
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
