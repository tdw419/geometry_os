; DESCRIPTION: Places a white 24x61 rectangle at position (195, 30).
; PLAN: r0=195(x), r1=30(y), r2=24(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 30
LDI r2, 24
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
