; DESCRIPTION: Draws a red line from (225, 114) to (59, 16).
; PLAN: r0=225(x1), r1=114(y1), r2=59(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 114
LDI r2, 59
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
