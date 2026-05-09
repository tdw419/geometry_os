; DESCRIPTION: Composite: Renders a orange box of size 61x70 starting at (441, 97) then Sets a single purple pixel at (393, 108).
; PLAN: r0=441(x), r1=97(y), r2=61(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=393(x), r6=108(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 441
LDI r1, 97
LDI r2, 61
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 108
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
