; DESCRIPTION: Places a white 70x107 box at position (377, 156).
; PLAN: r0=377(x), r1=156(y), r2=70(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 156
LDI r2, 70
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
