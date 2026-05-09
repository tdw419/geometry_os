; DESCRIPTION: Places a cyan line segment connecting (53, 139) to (104, 103).
; PLAN: r0=53(x1), r1=139(y1), r2=104(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 139
LDI r2, 104
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
