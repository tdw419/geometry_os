; DESCRIPTION: Composite: Places a green dot at position (230, 249) then Creates a purple rectangular region at (189, 28) spanning 74 by 39 pixels.
; PLAN: r0=230(x), r1=249(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=189(x), r6=28(y), r7=74(width), r8=39(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 230
LDI r1, 249
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 189
LDI r6, 28
LDI r7, 74
LDI r8, 39
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
