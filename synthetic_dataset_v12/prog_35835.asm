; DESCRIPTION: Draws a cyan line from (187, 157) to (343, 253).
; PLAN: r0=187(x1), r1=157(y1), r2=343(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 157
LDI r2, 343
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
