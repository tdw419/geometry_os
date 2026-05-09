; DESCRIPTION: Places a cyan line segment connecting (372, 235) to (310, 242).
; PLAN: r0=372(x1), r1=235(y1), r2=310(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 235
LDI r2, 310
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
