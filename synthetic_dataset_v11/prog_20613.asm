; DESCRIPTION: Places a white 56x98 rectangle at position (47, 117).
; PLAN: r0=47(x), r1=117(y), r2=56(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 117
LDI r2, 56
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
