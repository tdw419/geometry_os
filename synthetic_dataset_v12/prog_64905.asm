; DESCRIPTION: Places a red 81x113 rectangle at position (146, 72).
; PLAN: r0=146(x), r1=72(y), r2=81(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 72
LDI r2, 81
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
