; DESCRIPTION: Places a red 114x64 rectangle at position (55, 29).
; PLAN: r0=55(x), r1=29(y), r2=114(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 29
LDI r2, 114
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
