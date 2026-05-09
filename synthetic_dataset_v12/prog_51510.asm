; DESCRIPTION: Places a white 103x78 rectangle at position (294, 0).
; PLAN: r0=294(x), r1=0(y), r2=103(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 0
LDI r2, 103
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
