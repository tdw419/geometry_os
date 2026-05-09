; DESCRIPTION: Composite: Places a purple 34x14 rectangle at position (329, 205) then Places a red dot at position (482, 43).
; PLAN: r0=329(x), r1=205(y), r2=34(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=482(x), r6=43(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 329
LDI r1, 205
LDI r2, 34
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 43
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
