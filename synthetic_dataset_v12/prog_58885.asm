; DESCRIPTION: Places a cyan line segment connecting (380, 233) to (299, 232).
; PLAN: r0=380(x1), r1=233(y1), r2=299(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 233
LDI r2, 299
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
