; DESCRIPTION: Composite: Sets a single purple pixel at (479, 164) then Renders a cyan box of size 75x46 starting at (408, 108).
; PLAN: r0=479(x), r1=164(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=408(x), r6=108(y), r7=75(width), r8=46(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 479
LDI r1, 164
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 408
LDI r6, 108
LDI r7, 75
LDI r8, 46
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
