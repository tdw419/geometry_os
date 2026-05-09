; DESCRIPTION: Composite: . Then Places a orange dot at position (70, 197). Then Creates a white rectangular region at (63, 89) spanning 28 by 99 pixels.
; PLAN: r0=70(x), r1=197(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=63(x), r1=89(y), r2=28(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (70, 197).
; PLAN: r0=70(x), r1=197(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 197
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Creates a white rectangular region at (63, 89) spanning 28 by 99 pixels.
; PLAN: r0=63(x), r1=89(y), r2=28(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 89
LDI r2, 28
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
