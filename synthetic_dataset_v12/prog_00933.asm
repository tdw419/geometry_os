; DESCRIPTION: Places a black 16x65 rectangle at position (415, 114).
; PLAN: r0=415(x), r1=114(y), r2=16(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 114
LDI r2, 16
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
