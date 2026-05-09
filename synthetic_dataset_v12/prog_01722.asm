; DESCRIPTION: Places a white 113x66 rectangle at position (246, 165).
; PLAN: r0=246(x), r1=165(y), r2=113(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 165
LDI r2, 113
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
