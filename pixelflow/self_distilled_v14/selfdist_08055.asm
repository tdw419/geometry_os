; DESCRIPTION: Draws a cyan circle centered at (228, 82) with radius 19.
; PLAN: r0=228(x), r1=82(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 82
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
