; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (84, 146) with radius 68. Then Sets a single yellow pixel at (240, 168).
; PLAN: r0=84(x), r1=146(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=240(x), r1=168(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan circle centered at (84, 146) with radius 68.
; PLAN: r0=84(x), r1=146(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 146
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single yellow pixel at (240, 168).
; PLAN: r0=240(x), r1=168(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 240
LDI r1, 168
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
