; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (57, 143) to (44, 233). Then Draws a white circle centered at (195, 49) with radius 31.
; PLAN: r0=57(x1), r1=143(y1), r2=44(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=195(x), r1=49(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan line segment connecting (57, 143) to (44, 233).
; PLAN: r0=57(x1), r1=143(y1), r2=44(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 143
LDI r2, 44
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white circle centered at (195, 49) with radius 31.
; PLAN: r0=195(x), r1=49(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 49
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
