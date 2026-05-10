; DESCRIPTION: Places a red 70x65 rectangle at position (133, 62).
; PLAN: r0=133(x), r1=62(y), r2=70(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 62
LDI r2, 70
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
