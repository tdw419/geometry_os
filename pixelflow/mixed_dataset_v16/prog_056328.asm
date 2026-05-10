; DESCRIPTION: Draws a cyan line from (210, 59) to (7, 106).
; PLAN: r0=210(x1), r1=59(y1), r2=7(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 59
LDI r2, 7
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
