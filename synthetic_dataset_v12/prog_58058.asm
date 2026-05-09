; DESCRIPTION: Renders a magenta box of size 48x33 starting at (103, 157).
; PLAN: r0=103(x), r1=157(y), r2=48(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 157
LDI r2, 48
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
