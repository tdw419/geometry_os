; DESCRIPTION: Places a red 112x57 rectangle at position (220, 100).
; PLAN: r0=220(x), r1=100(y), r2=112(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 100
LDI r2, 112
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
