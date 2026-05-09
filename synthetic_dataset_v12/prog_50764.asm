; DESCRIPTION: Renders a magenta box of size 68x30 starting at (220, 198).
; PLAN: r0=220(x), r1=198(y), r2=68(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 198
LDI r2, 68
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
