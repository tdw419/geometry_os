; DESCRIPTION: Renders a magenta box of size 30x91 starting at (39, 113).
; PLAN: r0=39(x), r1=113(y), r2=30(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 113
LDI r2, 30
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
