; DESCRIPTION: Renders a magenta box of size 119x61 starting at (284, 47).
; PLAN: r0=284(x), r1=47(y), r2=119(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 47
LDI r2, 119
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
