; DESCRIPTION: Draws a cyan line from (422, 139) to (31, 239).
; PLAN: r0=422(x1), r1=139(y1), r2=31(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 139
LDI r2, 31
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
