; DESCRIPTION: Composite: Renders a cyan box of size 27x70 starting at (324, 159) then Places a red dot at position (39, 14).
; PLAN: r0=324(x), r1=159(y), r2=27(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=39(x), r6=14(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 324
LDI r1, 159
LDI r2, 27
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 39
LDI r6, 14
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
