; DESCRIPTION: Renders a magenta box of size 95x120 starting at (110, 86).
; PLAN: r0=110(x), r1=86(y), r2=95(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 86
LDI r2, 95
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
