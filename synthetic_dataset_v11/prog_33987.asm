; DESCRIPTION: Places a magenta 113x107 rectangle at position (68, 21).
; PLAN: r0=68(x), r1=21(y), r2=113(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 21
LDI r2, 113
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
