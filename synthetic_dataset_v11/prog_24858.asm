; DESCRIPTION: Composite: . Then Sets a single black pixel at (92, 123). Then Places a red 96x98 rectangle at position (46, 128).
; PLAN: r0=92(x), r1=123(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=46(x), r1=128(y), r2=96(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (92, 123).
; PLAN: r0=92(x), r1=123(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 92
LDI r1, 123
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a red 96x98 rectangle at position (46, 128).
; PLAN: r0=46(x), r1=128(y), r2=96(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 128
LDI r2, 96
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
