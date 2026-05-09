; DESCRIPTION: Places a black 12x48 rectangle at position (4, 165).
; PLAN: r0=4(x), r1=165(y), r2=12(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 165
LDI r2, 12
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
