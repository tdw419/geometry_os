; DESCRIPTION: Places a red 16x46 rectangle at position (384, 116).
; PLAN: r0=384(x), r1=116(y), r2=16(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 116
LDI r2, 16
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
