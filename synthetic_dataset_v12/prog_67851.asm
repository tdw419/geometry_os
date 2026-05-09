; DESCRIPTION: Places a white 10x82 rectangle at position (372, 14).
; PLAN: r0=372(x), r1=14(y), r2=10(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 14
LDI r2, 10
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
