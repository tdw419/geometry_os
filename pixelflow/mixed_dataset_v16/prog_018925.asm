; DESCRIPTION: Composite: Sets a single white pixel at (107, 126) then Creates a blue rectangular region at (193, 103) spanning 22 by 88 pixels.
; PLAN: r0=107(x), r1=126(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=193(x), r6=103(y), r7=22(width), r8=88(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 126
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 193
LDI r6, 103
LDI r7, 22
LDI r8, 88
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
