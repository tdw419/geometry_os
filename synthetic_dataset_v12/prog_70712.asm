; DESCRIPTION: Places a cyan line segment connecting (238, 113) to (187, 241).
; PLAN: r0=238(x1), r1=113(y1), r2=187(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 113
LDI r2, 187
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
