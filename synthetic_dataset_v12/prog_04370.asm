; DESCRIPTION: Places a black 44x61 rectangle at position (382, 178).
; PLAN: r0=382(x), r1=178(y), r2=44(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 178
LDI r2, 44
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
