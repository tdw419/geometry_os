; DESCRIPTION: Composite: . Then Places a cyan dot at position (69, 56). Then Renders a cyan box of size 88x93 starting at (57, 157).
; PLAN: r0=69(x), r1=56(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=57(x), r1=157(y), r2=88(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (69, 56).
; PLAN: r0=69(x), r1=56(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 69
LDI r1, 56
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan box of size 88x93 starting at (57, 157).
; PLAN: r0=57(x), r1=157(y), r2=88(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 157
LDI r2, 88
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
