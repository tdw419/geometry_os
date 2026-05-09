; DESCRIPTION: Places a cyan line segment connecting (289, 157) to (83, 228).
; PLAN: r0=289(x1), r1=157(y1), r2=83(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 157
LDI r2, 83
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
