; DESCRIPTION: Places a magenta 113x117 rectangle at position (138, 38).
; PLAN: r0=138(x), r1=38(y), r2=113(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 38
LDI r2, 113
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
