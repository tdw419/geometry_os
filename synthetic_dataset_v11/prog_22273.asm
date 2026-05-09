; DESCRIPTION: Renders a magenta box of size 46x42 starting at (72, 3).
; PLAN: r0=72(x), r1=3(y), r2=46(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 3
LDI r2, 46
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
