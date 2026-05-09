; DESCRIPTION: Places a magenta 28x64 rectangle at position (125, 57).
; PLAN: r0=125(x), r1=57(y), r2=28(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 57
LDI r2, 28
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
