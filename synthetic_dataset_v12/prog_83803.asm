; DESCRIPTION: Places a white 103x81 rectangle at position (222, 117).
; PLAN: r0=222(x), r1=117(y), r2=103(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 117
LDI r2, 103
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
