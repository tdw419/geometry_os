; DESCRIPTION: Places a cyan line segment connecting (465, 165) to (53, 98).
; PLAN: r0=465(x1), r1=165(y1), r2=53(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 165
LDI r2, 53
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
