; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (64, 37) spanning 91 by 89 pixels. Then Places a white dot at position (207, 73).
; PLAN: r0=64(x), r1=37(y), r2=91(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=207(x), r1=73(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a magenta rectangular region at (64, 37) spanning 91 by 89 pixels.
; PLAN: r0=64(x), r1=37(y), r2=91(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 37
LDI r2, 91
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (207, 73).
; PLAN: r0=207(x), r1=73(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 207
LDI r1, 73
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
