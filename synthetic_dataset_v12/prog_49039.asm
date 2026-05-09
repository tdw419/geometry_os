; DESCRIPTION: Places a cyan line segment connecting (142, 210) to (340, 156).
; PLAN: r0=142(x1), r1=210(y1), r2=340(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 210
LDI r2, 340
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
