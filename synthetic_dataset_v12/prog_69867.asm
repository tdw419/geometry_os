; DESCRIPTION: Renders a magenta box of size 103x109 starting at (51, 59).
; PLAN: r0=51(x), r1=59(y), r2=103(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 59
LDI r2, 103
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
