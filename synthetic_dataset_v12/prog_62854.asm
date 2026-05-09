; DESCRIPTION: Places a red line segment connecting (494, 213) to (39, 63).
; PLAN: r0=494(x1), r1=213(y1), r2=39(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 213
LDI r2, 39
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
