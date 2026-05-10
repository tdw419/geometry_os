; DESCRIPTION: Composite: Renders a cyan box of size 25x77 starting at (30, 43) then Places a white dot at position (45, 187).
; PLAN: r0=30(x), r1=43(y), r2=25(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=45(x), r6=187(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 30
LDI r1, 43
LDI r2, 25
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 187
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
