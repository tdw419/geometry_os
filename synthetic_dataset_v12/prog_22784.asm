; DESCRIPTION: Renders a magenta box of size 13x102 starting at (493, 14).
; PLAN: r0=493(x), r1=14(y), r2=13(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 14
LDI r2, 13
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
