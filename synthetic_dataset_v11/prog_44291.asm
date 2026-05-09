; DESCRIPTION: Composite: . Then Places a black 65x28 rectangle at position (182, 105). Then Places a cyan dot at position (81, 215).
; PLAN: r0=182(x), r1=105(y), r2=65(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=81(x), r1=215(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black 65x28 rectangle at position (182, 105).
; PLAN: r0=182(x), r1=105(y), r2=65(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 105
LDI r2, 65
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (81, 215).
; PLAN: r0=81(x), r1=215(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 215
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
