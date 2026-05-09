; DESCRIPTION: Draws a cyan line from (46, 204) to (225, 234).
; PLAN: r0=46(x1), r1=204(y1), r2=225(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 204
LDI r2, 225
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
