; DESCRIPTION: Places a cyan line segment connecting (64, 190) to (499, 170).
; PLAN: r0=64(x1), r1=190(y1), r2=499(x2), r3=170(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 190
LDI r2, 499
LDI r3, 170
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
