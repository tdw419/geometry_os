; DESCRIPTION: Places a white 13x50 rectangle at position (188, 89).
; PLAN: r0=188(x), r1=89(y), r2=13(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 89
LDI r2, 13
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
