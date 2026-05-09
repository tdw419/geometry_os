; DESCRIPTION: Composite: . Then Places a red dot at position (125, 31). Then Renders a cyan box of size 66x96 starting at (120, 81).
; PLAN: r0=125(x), r1=31(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=120(x), r1=81(y), r2=66(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (125, 31).
; PLAN: r0=125(x), r1=31(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 125
LDI r1, 31
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan box of size 66x96 starting at (120, 81).
; PLAN: r0=120(x), r1=81(y), r2=66(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 81
LDI r2, 66
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
