; DESCRIPTION: Places a white 107x115 rectangle at position (375, 141).
; PLAN: r0=375(x), r1=141(y), r2=107(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 141
LDI r2, 107
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
