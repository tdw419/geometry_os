; DESCRIPTION: Renders a magenta box of size 18x120 starting at (374, 14).
; PLAN: r0=374(x), r1=14(y), r2=18(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 14
LDI r2, 18
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
