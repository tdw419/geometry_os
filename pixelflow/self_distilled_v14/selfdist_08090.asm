; DESCRIPTION: Draws a cyan line from (240, 153) to (327, 77).
; PLAN: r0=240(x1), r1=153(y1), r2=327(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 153
LDI r2, 327
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
