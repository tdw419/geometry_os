; DESCRIPTION: Composite: Sets a single white pixel at (482, 162) then Draws a white line from (416, 114) to (249, 49).
; PLAN: r0=482(x), r1=162(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=416(x1), r6=114(y1), r7=249(x2), r8=49(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 482
LDI r1, 162
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 416
LDI r6, 114
LDI r7, 249
LDI r8, 49
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
