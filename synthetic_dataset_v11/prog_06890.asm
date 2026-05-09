; DESCRIPTION: Places a red 46x15 rectangle at position (165, 133).
; PLAN: r0=165(x), r1=133(y), r2=46(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 133
LDI r2, 46
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
