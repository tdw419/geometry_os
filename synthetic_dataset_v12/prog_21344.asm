; DESCRIPTION: Draws a cyan line from (443, 191) to (185, 6).
; PLAN: r0=443(x1), r1=191(y1), r2=185(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 191
LDI r2, 185
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
