; DESCRIPTION: Places a white 97x87 rectangle at position (262, 28).
; PLAN: r0=262(x), r1=28(y), r2=97(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 28
LDI r2, 97
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
