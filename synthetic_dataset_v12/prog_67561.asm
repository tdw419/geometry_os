; DESCRIPTION: Places a magenta 57x116 rectangle at position (450, 14).
; PLAN: r0=450(x), r1=14(y), r2=57(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 14
LDI r2, 57
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
