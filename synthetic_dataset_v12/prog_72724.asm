; DESCRIPTION: Composite: Places a red circle of radius 16 at center (253, 39) then Places a magenta dot at position (307, 183).
; PLAN: r0=253(x), r1=39(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x), r6=183(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 253
LDI r1, 39
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 183
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
