; DESCRIPTION: Draws a green line from (111, 209) to (59, 162).
; PLAN: r0=111(x1), r1=209(y1), r2=59(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 209
LDI r2, 59
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
