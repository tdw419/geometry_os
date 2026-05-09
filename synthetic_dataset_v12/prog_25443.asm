; DESCRIPTION: Renders a magenta box of size 110x98 starting at (255, 60).
; PLAN: r0=255(x), r1=60(y), r2=110(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 60
LDI r2, 110
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
