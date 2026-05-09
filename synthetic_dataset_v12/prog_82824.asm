; DESCRIPTION: Draws a cyan line from (422, 205) to (286, 74).
; PLAN: r0=422(x1), r1=205(y1), r2=286(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 205
LDI r2, 286
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
