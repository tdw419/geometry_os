; DESCRIPTION: Places a white 50x58 rectangle at position (171, 11).
; PLAN: r0=171(x), r1=11(y), r2=50(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 11
LDI r2, 50
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
