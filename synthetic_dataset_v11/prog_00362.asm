; DESCRIPTION: Renders a magenta box of size 31x72 starting at (48, 133).
; PLAN: r0=48(x), r1=133(y), r2=31(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 133
LDI r2, 31
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
