; DESCRIPTION: Composite: Places a yellow 33x30 rectangle at position (178, 25) then Places a red dot at position (250, 50).
; PLAN: r0=178(x), r1=25(y), r2=33(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=250(x), r6=50(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 178
LDI r1, 25
LDI r2, 33
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 50
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
