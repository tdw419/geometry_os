; DESCRIPTION: Composite: Renders a magenta disk with center (275, 24) and radius 24 then Places a black 93x46 rectangle at position (292, 177).
; PLAN: r0=275(x), r1=24(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=292(x), r6=177(y), r7=93(width), r8=46(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 275
LDI r1, 24
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 292
LDI r6, 177
LDI r7, 93
LDI r8, 46
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
