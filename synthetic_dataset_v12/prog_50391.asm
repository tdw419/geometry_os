; DESCRIPTION: Places a cyan line segment connecting (386, 188) to (329, 104).
; PLAN: r0=386(x1), r1=188(y1), r2=329(x2), r3=104(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 188
LDI r2, 329
LDI r3, 104
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
