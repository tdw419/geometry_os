; DESCRIPTION: Renders a magenta box of size 38x116 starting at (263, 39).
; PLAN: r0=263(x), r1=39(y), r2=38(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 39
LDI r2, 38
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
