; DESCRIPTION: Places a magenta 65x112 rectangle at position (262, 94).
; PLAN: r0=262(x), r1=94(y), r2=65(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 94
LDI r2, 65
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
