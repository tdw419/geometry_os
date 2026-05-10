; DESCRIPTION: Places a cyan line segment connecting (344, 100) to (214, 200).
; PLAN: r0=344(x1), r1=100(y1), r2=214(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 100
LDI r2, 214
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
