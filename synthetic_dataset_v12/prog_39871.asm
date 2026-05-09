; DESCRIPTION: Draws a cyan line from (372, 204) to (273, 39).
; PLAN: r0=372(x1), r1=204(y1), r2=273(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 204
LDI r2, 273
LDI r3, 39
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
