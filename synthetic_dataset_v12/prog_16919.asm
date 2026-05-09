; DESCRIPTION: Places a white 75x94 rectangle at position (25, 107).
; PLAN: r0=25(x), r1=107(y), r2=75(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 107
LDI r2, 75
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
