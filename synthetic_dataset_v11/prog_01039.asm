; DESCRIPTION: Composite: . Then Draws a black line from (57, 90) to (32, 124). Then Creates a cyan circular shape at (177, 104) with radius 65.
; PLAN: r0=57(x1), r1=90(y1), r2=32(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=177(x), r1=104(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a black line from (57, 90) to (32, 124).
; PLAN: r0=57(x1), r1=90(y1), r2=32(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 90
LDI r2, 32
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan circular shape at (177, 104) with radius 65.
; PLAN: r0=177(x), r1=104(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 104
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
