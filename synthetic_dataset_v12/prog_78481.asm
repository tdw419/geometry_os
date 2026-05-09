; DESCRIPTION: Places a cyan line segment connecting (354, 75) to (440, 184).
; PLAN: r0=354(x1), r1=75(y1), r2=440(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 75
LDI r2, 440
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
