; DESCRIPTION: Composite: Places a yellow 111x87 rectangle at position (350, 16) then Places a white dot at position (98, 121).
; PLAN: r0=350(x), r1=16(y), r2=111(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=98(x), r6=121(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 350
LDI r1, 16
LDI r2, 111
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 121
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
