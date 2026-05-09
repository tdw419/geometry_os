; DESCRIPTION: Places a white 107x105 rectangle at position (273, 1).
; PLAN: r0=273(x), r1=1(y), r2=107(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 1
LDI r2, 107
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
