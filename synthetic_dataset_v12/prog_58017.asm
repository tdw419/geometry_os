; DESCRIPTION: Composite: Places a yellow 117x46 rectangle at position (268, 12) then Places a purple dot at position (260, 99).
; PLAN: r0=268(x), r1=12(y), r2=117(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=260(x), r6=99(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 268
LDI r1, 12
LDI r2, 117
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 99
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
