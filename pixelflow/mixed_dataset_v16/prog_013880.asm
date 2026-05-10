; DESCRIPTION: Places a cyan line segment connecting (426, 178) to (294, 211).
; PLAN: r0=426(x1), r1=178(y1), r2=294(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 178
LDI r2, 294
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
