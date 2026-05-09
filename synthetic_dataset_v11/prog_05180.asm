; DESCRIPTION: Places a white 113x101 rectangle at position (57, 80).
; PLAN: r0=57(x), r1=80(y), r2=113(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 80
LDI r2, 113
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
