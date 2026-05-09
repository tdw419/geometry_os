; DESCRIPTION: Places a white 65x61 rectangle at position (75, 31).
; PLAN: r0=75(x), r1=31(y), r2=65(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 31
LDI r2, 65
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
