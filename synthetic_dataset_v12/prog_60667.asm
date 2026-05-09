; DESCRIPTION: Places a red 62x72 rectangle at position (337, 172).
; PLAN: r0=337(x), r1=172(y), r2=62(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 172
LDI r2, 62
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
