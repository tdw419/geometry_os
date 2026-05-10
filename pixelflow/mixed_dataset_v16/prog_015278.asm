; DESCRIPTION: Places a magenta 48x103 rectangle at position (200, 86).
; PLAN: r0=200(x), r1=86(y), r2=48(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 86
LDI r2, 48
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
