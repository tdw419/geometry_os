; DESCRIPTION: Places a cyan line segment connecting (17, 247) to (121, 38).
; PLAN: r0=17(x1), r1=247(y1), r2=121(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 247
LDI r2, 121
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
