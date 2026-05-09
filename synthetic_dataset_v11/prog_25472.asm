; DESCRIPTION: Renders a magenta box of size 111x73 starting at (116, 157).
; PLAN: r0=116(x), r1=157(y), r2=111(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 157
LDI r2, 111
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
