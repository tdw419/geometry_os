; DESCRIPTION: Composite: Renders a cyan box of size 16x117 starting at (417, 4) then Places a orange dot at position (464, 236).
; PLAN: r0=417(x), r1=4(y), r2=16(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=464(x), r6=236(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 417
LDI r1, 4
LDI r2, 16
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 236
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
