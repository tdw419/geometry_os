; DESCRIPTION: Places a white 17x93 rectangle at position (228, 72).
; PLAN: r0=228(x), r1=72(y), r2=17(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 72
LDI r2, 17
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
