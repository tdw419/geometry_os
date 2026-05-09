; DESCRIPTION: Renders a magenta box of size 24x67 starting at (174, 113).
; PLAN: r0=174(x), r1=113(y), r2=24(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 113
LDI r2, 24
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
