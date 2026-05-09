; DESCRIPTION: Places a red 46x81 rectangle at position (230, 153).
; PLAN: r0=230(x), r1=153(y), r2=46(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 153
LDI r2, 46
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
