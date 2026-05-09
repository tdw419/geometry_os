; DESCRIPTION: Places a white 65x85 rectangle at position (189, 134).
; PLAN: r0=189(x), r1=134(y), r2=65(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 134
LDI r2, 65
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
