; DESCRIPTION: Composite: Draws a magenta circle centered at (82, 111) with radius 76 then Sets a single cyan pixel at (246, 113).
; PLAN: r0=82(x), r1=111(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=246(x), r6=113(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 82
LDI r1, 111
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 246
LDI r6, 113
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
