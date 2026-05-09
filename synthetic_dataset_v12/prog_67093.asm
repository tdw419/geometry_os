; DESCRIPTION: Composite: Places a cyan 113x36 rectangle at position (46, 29) then Sets a single orange pixel at (235, 197).
; PLAN: r0=46(x), r1=29(y), r2=113(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=235(x), r6=197(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 46
LDI r1, 29
LDI r2, 113
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 197
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
