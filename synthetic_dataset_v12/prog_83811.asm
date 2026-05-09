; DESCRIPTION: Composite: Creates a blue rectangular region at (145, 18) spanning 29 by 16 pixels then Places a red dot at position (479, 46).
; PLAN: r0=145(x), r1=18(y), r2=29(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=479(x), r6=46(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 145
LDI r1, 18
LDI r2, 29
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 479
LDI r6, 46
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
