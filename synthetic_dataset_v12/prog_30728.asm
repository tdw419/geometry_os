; DESCRIPTION: Renders a magenta box of size 96x28 starting at (242, 42).
; PLAN: r0=242(x), r1=42(y), r2=96(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 42
LDI r2, 96
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
