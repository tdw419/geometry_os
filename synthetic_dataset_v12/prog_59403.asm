; DESCRIPTION: Draws a cyan circle centered at (166, 168) with radius 71.
; PLAN: r0=166(x), r1=168(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 168
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
