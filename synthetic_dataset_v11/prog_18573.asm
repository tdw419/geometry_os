; DESCRIPTION: Draws a cyan line from (156, 191) to (75, 237).
; PLAN: r0=156(x1), r1=191(y1), r2=75(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 191
LDI r2, 75
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
