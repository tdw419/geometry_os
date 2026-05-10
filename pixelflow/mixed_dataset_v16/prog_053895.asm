; DESCRIPTION: Places a cyan line segment connecting (372, 235) to (267, 73).
; PLAN: r0=372(x1), r1=235(y1), r2=267(x2), r3=73(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 235
LDI r2, 267
LDI r3, 73
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
