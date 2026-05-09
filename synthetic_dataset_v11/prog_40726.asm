; DESCRIPTION: Composite: . Then Creates a white rectangular region at (104, 132) spanning 32 by 111 pixels. Then Places a black dot at position (128, 73).
; PLAN: r0=104(x), r1=132(y), r2=32(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=128(x), r1=73(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a white rectangular region at (104, 132) spanning 32 by 111 pixels.
; PLAN: r0=104(x), r1=132(y), r2=32(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 132
LDI r2, 32
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (128, 73).
; PLAN: r0=128(x), r1=73(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 128
LDI r1, 73
LDI r2, 0x000000
PSET r0, r1, r2
HALT
