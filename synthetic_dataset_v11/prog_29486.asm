; DESCRIPTION: Places a magenta 106x45 rectangle at position (134, 27).
; PLAN: r0=134(x), r1=27(y), r2=106(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 27
LDI r2, 106
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
