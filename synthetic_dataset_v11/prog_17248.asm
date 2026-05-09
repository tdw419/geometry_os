; DESCRIPTION: Places a white 94x18 rectangle at position (140, 194).
; PLAN: r0=140(x), r1=194(y), r2=94(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 194
LDI r2, 94
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
