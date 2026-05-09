; DESCRIPTION: Places a cyan line segment connecting (122, 166) to (212, 135).
; PLAN: r0=122(x1), r1=166(y1), r2=212(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 166
LDI r2, 212
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
