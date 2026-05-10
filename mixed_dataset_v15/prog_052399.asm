; DESCRIPTION: Places a magenta line segment connecting (410, 104) to (117, 121).
; PLAN: r0=410(x1), r1=104(y1), r2=117(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 104
LDI r2, 117
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
