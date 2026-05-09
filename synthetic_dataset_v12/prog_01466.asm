; DESCRIPTION: Places a magenta 24x116 rectangle at position (3, 38).
; PLAN: r0=3(x), r1=38(y), r2=24(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 38
LDI r2, 24
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
