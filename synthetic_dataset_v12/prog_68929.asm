; DESCRIPTION: Places a orange 82x65 rectangle at position (384, 53).
; PLAN: r0=384(x), r1=53(y), r2=82(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 53
LDI r2, 82
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
