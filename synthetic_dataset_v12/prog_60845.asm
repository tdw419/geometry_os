; DESCRIPTION: Renders a magenta box of size 81x64 starting at (356, 171).
; PLAN: r0=356(x), r1=171(y), r2=81(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 171
LDI r2, 81
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
