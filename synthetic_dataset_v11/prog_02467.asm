; DESCRIPTION: Places a red line segment connecting (209, 37) to (240, 177).
; PLAN: r0=209(x1), r1=37(y1), r2=240(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 37
LDI r2, 240
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
