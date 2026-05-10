; DESCRIPTION: Places a cyan line segment connecting (419, 4) to (246, 215).
; PLAN: r0=419(x1), r1=4(y1), r2=246(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 4
LDI r2, 246
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
