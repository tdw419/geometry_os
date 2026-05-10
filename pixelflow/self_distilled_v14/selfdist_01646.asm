; DESCRIPTION: Creates a magenta filled rectangle of size 20x10 starting at (273, 197).
; PLAN: r0=273(x), r1=197(y), r2=20(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 197
LDI r2, 20
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
