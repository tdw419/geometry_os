; DESCRIPTION: Draws a cyan line from (225, 68) to (117, 141).
; PLAN: r0=225(x1), r1=68(y1), r2=117(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 68
LDI r2, 117
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
