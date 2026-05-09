; DESCRIPTION: Places a red 29x64 rectangle at position (223, 156).
; PLAN: r0=223(x), r1=156(y), r2=29(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 156
LDI r2, 29
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
