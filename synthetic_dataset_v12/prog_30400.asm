; DESCRIPTION: Renders a white box of size 108x115 starting at (149, 57).
; PLAN: r0=149(x), r1=57(y), r2=108(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 57
LDI r2, 108
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
