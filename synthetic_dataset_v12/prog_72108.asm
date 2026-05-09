; DESCRIPTION: Composite: Sets a single green pixel at (436, 97) then Creates a cyan rectangular region at (67, 70) spanning 43 by 53 pixels.
; PLAN: r0=436(x), r1=97(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=67(x), r6=70(y), r7=43(width), r8=53(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 436
LDI r1, 97
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 67
LDI r6, 70
LDI r7, 43
LDI r8, 53
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
