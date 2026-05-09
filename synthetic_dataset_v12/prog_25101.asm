; DESCRIPTION: Places a cyan line segment connecting (419, 240) to (294, 109).
; PLAN: r0=419(x1), r1=240(y1), r2=294(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 240
LDI r2, 294
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
