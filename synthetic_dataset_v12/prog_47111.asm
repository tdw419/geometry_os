; DESCRIPTION: Places a red 27x102 rectangle at position (304, 116).
; PLAN: r0=304(x), r1=116(y), r2=27(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 116
LDI r2, 27
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
