; DESCRIPTION: Places a red 84x82 rectangle at position (48, 123).
; PLAN: r0=48(x), r1=123(y), r2=84(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 123
LDI r2, 84
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
