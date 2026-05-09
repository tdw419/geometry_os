; DESCRIPTION: Renders a magenta box of size 22x25 starting at (348, 231).
; PLAN: r0=348(x), r1=231(y), r2=22(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 231
LDI r2, 22
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
