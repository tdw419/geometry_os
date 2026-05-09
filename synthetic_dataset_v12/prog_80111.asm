; DESCRIPTION: Places a cyan line segment connecting (221, 12) to (429, 240).
; PLAN: r0=221(x1), r1=12(y1), r2=429(x2), r3=240(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 12
LDI r2, 429
LDI r3, 240
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
