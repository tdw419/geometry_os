; DESCRIPTION: Places a magenta 35x93 rectangle at position (446, 125).
; PLAN: r0=446(x), r1=125(y), r2=35(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 125
LDI r2, 35
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
