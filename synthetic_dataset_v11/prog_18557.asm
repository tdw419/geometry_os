; DESCRIPTION: Places a white 112x107 rectangle at position (72, 117).
; PLAN: r0=72(x), r1=117(y), r2=112(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 117
LDI r2, 112
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
