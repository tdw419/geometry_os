; DESCRIPTION: Places a cyan line segment connecting (310, 173) to (494, 15).
; PLAN: r0=310(x1), r1=173(y1), r2=494(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 173
LDI r2, 494
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
