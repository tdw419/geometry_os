; DESCRIPTION: Draws a green line from (410, 31) to (341, 221).
; PLAN: r0=410(x1), r1=31(y1), r2=341(x2), r3=221(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 31
LDI r2, 341
LDI r3, 221
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
