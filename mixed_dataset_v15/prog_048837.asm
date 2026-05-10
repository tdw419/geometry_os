; DESCRIPTION: Places a magenta 19x63 rectangle at position (280, 146).
; PLAN: r0=280(x), r1=146(y), r2=19(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 146
LDI r2, 19
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
