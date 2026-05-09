; DESCRIPTION: Places a red 115x64 rectangle at position (353, 182).
; PLAN: r0=353(x), r1=182(y), r2=115(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 182
LDI r2, 115
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
