; DESCRIPTION: Places a red 63x112 rectangle at position (200, 125).
; PLAN: r0=200(x), r1=125(y), r2=63(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 125
LDI r2, 63
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
