; DESCRIPTION: Draws a cyan line from (422, 159) to (396, 55).
; PLAN: r0=422(x1), r1=159(y1), r2=396(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 159
LDI r2, 396
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
