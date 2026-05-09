; DESCRIPTION: Renders a magenta box of size 32x49 starting at (48, 187).
; PLAN: r0=48(x), r1=187(y), r2=32(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 187
LDI r2, 32
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
