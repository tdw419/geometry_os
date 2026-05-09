; DESCRIPTION: Renders a magenta box of size 92x30 starting at (143, 14).
; PLAN: r0=143(x), r1=14(y), r2=92(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 14
LDI r2, 92
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
