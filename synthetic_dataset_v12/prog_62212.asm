; DESCRIPTION: Places a cyan line segment connecting (460, 117) to (377, 141).
; PLAN: r0=460(x1), r1=117(y1), r2=377(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 117
LDI r2, 377
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
