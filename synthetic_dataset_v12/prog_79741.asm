; DESCRIPTION: Draws a cyan line from (170, 206) to (124, 172).
; PLAN: r0=170(x1), r1=206(y1), r2=124(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 206
LDI r2, 124
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
