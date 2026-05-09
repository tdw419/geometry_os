; DESCRIPTION: Places a magenta 113x50 rectangle at position (81, 171).
; PLAN: r0=81(x), r1=171(y), r2=113(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 171
LDI r2, 113
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
