; DESCRIPTION: Draws a cyan line from (80, 212) to (167, 171).
; PLAN: r0=80(x1), r1=212(y1), r2=167(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 212
LDI r2, 167
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
