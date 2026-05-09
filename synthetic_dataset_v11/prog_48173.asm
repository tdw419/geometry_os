; DESCRIPTION: Draws a cyan line from (176, 172) to (38, 114).
; PLAN: r0=176(x1), r1=172(y1), r2=38(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 172
LDI r2, 38
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
