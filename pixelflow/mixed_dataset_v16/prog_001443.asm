; DESCRIPTION: Composite: Creates a purple rectangular region at (70, 39) spanning 83 by 108 pixels then Places a green dot at position (366, 197).
; PLAN: r0=70(x), r1=39(y), r2=83(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=366(x), r6=197(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 70
LDI r1, 39
LDI r2, 83
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 197
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
