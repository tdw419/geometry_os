; DESCRIPTION: Composite: . Then Renders a green box of size 102x51 starting at (128, 193). Then Sets a single green pixel at (242, 11).
; PLAN: r0=128(x), r1=193(y), r2=102(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=242(x), r1=11(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green box of size 102x51 starting at (128, 193).
; PLAN: r0=128(x), r1=193(y), r2=102(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 193
LDI r2, 102
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (242, 11).
; PLAN: r0=242(x), r1=11(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 242
LDI r1, 11
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
