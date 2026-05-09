; DESCRIPTION: Places a white 17x86 rectangle at position (399, 84).
; PLAN: r0=399(x), r1=84(y), r2=17(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 84
LDI r2, 17
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
