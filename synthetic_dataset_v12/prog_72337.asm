; DESCRIPTION: Draws a cyan line from (481, 3) to (77, 38).
; PLAN: r0=481(x1), r1=3(y1), r2=77(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 3
LDI r2, 77
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
