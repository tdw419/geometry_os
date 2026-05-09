; DESCRIPTION: Renders a magenta box of size 14x64 starting at (48, 169).
; PLAN: r0=48(x), r1=169(y), r2=14(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 169
LDI r2, 14
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
