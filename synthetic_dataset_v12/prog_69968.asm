; DESCRIPTION: Draws a cyan line from (207, 148) to (422, 131).
; PLAN: r0=207(x1), r1=148(y1), r2=422(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 148
LDI r2, 422
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
