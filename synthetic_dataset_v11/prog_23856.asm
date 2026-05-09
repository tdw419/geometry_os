; DESCRIPTION: Places a red 46x116 rectangle at position (210, 35).
; PLAN: r0=210(x), r1=35(y), r2=46(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 35
LDI r2, 46
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
