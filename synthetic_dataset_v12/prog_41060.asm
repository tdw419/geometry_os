; DESCRIPTION: Places a black 92x113 rectangle at position (195, 139).
; PLAN: r0=195(x), r1=139(y), r2=92(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 139
LDI r2, 92
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
