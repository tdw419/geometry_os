; DESCRIPTION: Draws a cyan line from (167, 138) to (421, 185).
; PLAN: r0=167(x1), r1=138(y1), r2=421(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 138
LDI r2, 421
LDI r3, 185
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
