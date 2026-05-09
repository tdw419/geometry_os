; DESCRIPTION: Composite: . Then Places a black dot at position (251, 188). Then Places a white 42x96 rectangle at position (78, 39).
; PLAN: r0=251(x), r1=188(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=78(x), r1=39(y), r2=42(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (251, 188).
; PLAN: r0=251(x), r1=188(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 251
LDI r1, 188
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a white 42x96 rectangle at position (78, 39).
; PLAN: r0=78(x), r1=39(y), r2=42(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 39
LDI r2, 42
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
