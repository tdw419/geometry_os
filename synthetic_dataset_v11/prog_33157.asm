; DESCRIPTION: Renders a magenta box of size 111x38 starting at (64, 28).
; PLAN: r0=64(x), r1=28(y), r2=111(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 28
LDI r2, 111
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
