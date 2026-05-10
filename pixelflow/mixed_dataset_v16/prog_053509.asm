; DESCRIPTION: Places a cyan line segment connecting (510, 165) to (422, 153).
; PLAN: r0=510(x1), r1=165(y1), r2=422(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 165
LDI r2, 422
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
