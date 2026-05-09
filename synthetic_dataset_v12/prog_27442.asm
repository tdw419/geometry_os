; DESCRIPTION: Renders a magenta box of size 103x80 starting at (304, 36).
; PLAN: r0=304(x), r1=36(y), r2=103(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 36
LDI r2, 103
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
