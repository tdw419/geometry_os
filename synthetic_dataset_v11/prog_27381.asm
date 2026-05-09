; DESCRIPTION: Draws a cyan line from (229, 28) to (59, 114).
; PLAN: r0=229(x1), r1=28(y1), r2=59(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 28
LDI r2, 59
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
