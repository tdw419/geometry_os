; DESCRIPTION: Places a white 75x95 rectangle at position (293, 44).
; PLAN: r0=293(x), r1=44(y), r2=75(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 44
LDI r2, 75
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
