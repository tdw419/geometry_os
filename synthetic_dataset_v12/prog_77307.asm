; DESCRIPTION: Renders a magenta box of size 13x115 starting at (365, 84).
; PLAN: r0=365(x), r1=84(y), r2=13(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 84
LDI r2, 13
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
