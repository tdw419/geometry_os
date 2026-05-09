; DESCRIPTION: Composite: Creates a blue rectangular region at (279, 44) spanning 74 by 16 pixels then Places a orange dot at position (215, 43).
; PLAN: r0=279(x), r1=44(y), r2=74(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=215(x), r6=43(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 279
LDI r1, 44
LDI r2, 74
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 43
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
