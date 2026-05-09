; DESCRIPTION: Places a white line segment connecting (190, 221) to (344, 240).
; PLAN: r0=190(x1), r1=221(y1), r2=344(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 221
LDI r2, 344
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
