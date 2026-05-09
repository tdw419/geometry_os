; DESCRIPTION: Places a white 103x28 rectangle at position (109, 47).
; PLAN: r0=109(x), r1=47(y), r2=103(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 47
LDI r2, 103
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
