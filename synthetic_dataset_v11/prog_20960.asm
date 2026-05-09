; DESCRIPTION: Renders a magenta box of size 111x72 starting at (113, 146).
; PLAN: r0=113(x), r1=146(y), r2=111(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 146
LDI r2, 111
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
