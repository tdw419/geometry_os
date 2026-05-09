; DESCRIPTION: Composite: . Then Renders a cyan box of size 32x42 starting at (111, 19). Then Sets a single white pixel at (231, 8).
; PLAN: r0=111(x), r1=19(y), r2=32(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=231(x), r1=8(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan box of size 32x42 starting at (111, 19).
; PLAN: r0=111(x), r1=19(y), r2=32(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 19
LDI r2, 32
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (231, 8).
; PLAN: r0=231(x), r1=8(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 231
LDI r1, 8
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
