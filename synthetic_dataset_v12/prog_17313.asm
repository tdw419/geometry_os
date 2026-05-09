; DESCRIPTION: Composite: Places a green 46x105 rectangle at position (432, 79) then Places a purple dot at position (270, 73).
; PLAN: r0=432(x), r1=79(y), r2=46(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=270(x), r6=73(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 432
LDI r1, 79
LDI r2, 46
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 73
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
