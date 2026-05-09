; DESCRIPTION: Places a white 19x60 rectangle at position (468, 134).
; PLAN: r0=468(x), r1=134(y), r2=19(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 134
LDI r2, 19
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
