; DESCRIPTION: Creates a cyan circular shape at (146, 166) with radius 51.
; PLAN: r0=146(x), r1=166(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 166
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
