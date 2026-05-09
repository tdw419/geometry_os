; DESCRIPTION: Draws a cyan line from (24, 204) to (52, 14).
; PLAN: r0=24(x1), r1=204(y1), r2=52(x2), r3=14(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 204
LDI r2, 52
LDI r3, 14
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
