; DESCRIPTION: Places a cyan line segment connecting (57, 199) to (296, 167).
; PLAN: r0=57(x1), r1=199(y1), r2=296(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 199
LDI r2, 296
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
