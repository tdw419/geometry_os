; DESCRIPTION: Places a red 112x10 rectangle at position (213, 158).
; PLAN: r0=213(x), r1=158(y), r2=112(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 158
LDI r2, 112
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
