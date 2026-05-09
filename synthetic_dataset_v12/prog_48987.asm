; DESCRIPTION: Places a magenta 85x12 rectangle at position (237, 125).
; PLAN: r0=237(x), r1=125(y), r2=85(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 125
LDI r2, 85
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
