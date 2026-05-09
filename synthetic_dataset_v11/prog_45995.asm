; DESCRIPTION: Composite: . Then Places a cyan 63x18 rectangle at position (185, 41). Then Creates a white circular shape at (135, 28) with radius 10.
; PLAN: r0=185(x), r1=41(y), r2=63(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=135(x), r1=28(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan 63x18 rectangle at position (185, 41).
; PLAN: r0=185(x), r1=41(y), r2=63(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 41
LDI r2, 63
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white circular shape at (135, 28) with radius 10.
; PLAN: r0=135(x), r1=28(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 28
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
