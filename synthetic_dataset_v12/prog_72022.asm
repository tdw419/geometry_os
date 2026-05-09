; DESCRIPTION: Draws a cyan line from (176, 148) to (193, 114).
; PLAN: r0=176(x1), r1=148(y1), r2=193(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 148
LDI r2, 193
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
