; DESCRIPTION: Composite: Places a magenta circle of radius 19 at center (208, 178) then Places a cyan dot at position (46, 57).
; PLAN: r0=208(x), r1=178(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=46(x), r6=57(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 208
LDI r1, 178
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 46
LDI r6, 57
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
