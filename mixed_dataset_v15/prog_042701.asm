; DESCRIPTION: Composite: Places a magenta circle of radius 42 at center (94, 81) then Places a cyan dot at position (197, 210).
; PLAN: r0=94(x), r1=81(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=197(x), r6=210(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 94
LDI r1, 81
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 197
LDI r6, 210
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
