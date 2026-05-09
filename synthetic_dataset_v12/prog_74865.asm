; DESCRIPTION: Composite: Renders a cyan box of size 35x56 starting at (451, 3) then Sets a single purple pixel at (284, 180).
; PLAN: r0=451(x), r1=3(y), r2=35(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x), r6=180(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 451
LDI r1, 3
LDI r2, 35
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 180
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
