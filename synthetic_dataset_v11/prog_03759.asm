; DESCRIPTION: Places a white 113x94 rectangle at position (93, 117).
; PLAN: r0=93(x), r1=117(y), r2=113(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 117
LDI r2, 113
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
