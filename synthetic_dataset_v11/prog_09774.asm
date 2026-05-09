; DESCRIPTION: Composite: . Then Renders a blue box of size 35x48 starting at (42, 43). Then Places a yellow dot at position (241, 143).
; PLAN: r0=42(x), r1=43(y), r2=35(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=241(x), r1=143(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue box of size 35x48 starting at (42, 43).
; PLAN: r0=42(x), r1=43(y), r2=35(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 43
LDI r2, 35
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (241, 143).
; PLAN: r0=241(x), r1=143(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 241
LDI r1, 143
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
