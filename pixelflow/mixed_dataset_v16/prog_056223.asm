; DESCRIPTION: Places a cyan line segment connecting (467, 116) to (64, 195).
; PLAN: r0=467(x1), r1=116(y1), r2=64(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 116
LDI r2, 64
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
