; DESCRIPTION: Composite: . Then Places a orange dot at position (222, 35). Then Places a white 24x72 rectangle at position (96, 49).
; PLAN: r0=222(x), r1=35(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=96(x), r1=49(y), r2=24(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (222, 35).
; PLAN: r0=222(x), r1=35(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 222
LDI r1, 35
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a white 24x72 rectangle at position (96, 49).
; PLAN: r0=96(x), r1=49(y), r2=24(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 49
LDI r2, 24
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
