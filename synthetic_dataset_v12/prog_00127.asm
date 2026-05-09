; DESCRIPTION: Composite: Sets a single white pixel at (193, 206) then Draws a green line from (495, 74) to (505, 60).
; PLAN: r0=193(x), r1=206(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=495(x1), r6=74(y1), r7=505(x2), r8=60(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 206
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 495
LDI r6, 74
LDI r7, 505
LDI r8, 60
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
