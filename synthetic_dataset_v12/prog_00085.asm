; DESCRIPTION: Places a cyan line segment connecting (346, 242) to (155, 184).
; PLAN: r0=346(x1), r1=242(y1), r2=155(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 242
LDI r2, 155
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
