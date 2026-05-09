; DESCRIPTION: Renders a magenta box of size 10x68 starting at (242, 120).
; PLAN: r0=242(x), r1=120(y), r2=10(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 120
LDI r2, 10
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
