; DESCRIPTION: Places a white 85x103 rectangle at position (108, 71).
; PLAN: r0=108(x), r1=71(y), r2=85(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 71
LDI r2, 85
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
