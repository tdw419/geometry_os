; DESCRIPTION: Composite: Places a black 21x16 rectangle at position (225, 52) then Places a cyan dot at position (387, 85).
; PLAN: r0=225(x), r1=52(y), r2=21(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=387(x), r6=85(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 225
LDI r1, 52
LDI r2, 21
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 85
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
