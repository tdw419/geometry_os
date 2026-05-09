; DESCRIPTION: Composite: . Then Creates a black circular shape at (28, 146) with radius 28. Then Draws a cyan line from (208, 110) to (140, 143).
; PLAN: r0=28(x), r1=146(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=208(x1), r1=110(y1), r2=140(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a black circular shape at (28, 146) with radius 28.
; PLAN: r0=28(x), r1=146(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 146
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan line from (208, 110) to (140, 143).
; PLAN: r0=208(x1), r1=110(y1), r2=140(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 110
LDI r2, 140
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
