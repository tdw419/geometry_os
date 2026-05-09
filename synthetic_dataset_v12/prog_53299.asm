; DESCRIPTION: Places a white 66x50 rectangle at position (411, 31).
; PLAN: r0=411(x), r1=31(y), r2=66(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 31
LDI r2, 66
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
