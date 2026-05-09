; DESCRIPTION: Composite: . Then Places a white 30x104 rectangle at position (23, 130). Then Places a magenta dot at position (181, 123).
; PLAN: r0=23(x), r1=130(y), r2=30(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=181(x), r1=123(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white 30x104 rectangle at position (23, 130).
; PLAN: r0=23(x), r1=130(y), r2=30(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 130
LDI r2, 30
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (181, 123).
; PLAN: r0=181(x), r1=123(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 181
LDI r1, 123
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
