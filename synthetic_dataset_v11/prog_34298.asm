; DESCRIPTION: Composite: . Then Places a orange dot at position (95, 67). Then Places a cyan 115x44 rectangle at position (119, 28).
; PLAN: r0=95(x), r1=67(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=119(x), r1=28(y), r2=115(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (95, 67).
; PLAN: r0=95(x), r1=67(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 95
LDI r1, 67
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a cyan 115x44 rectangle at position (119, 28).
; PLAN: r0=119(x), r1=28(y), r2=115(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 28
LDI r2, 115
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
