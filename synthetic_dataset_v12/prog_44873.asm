; DESCRIPTION: Renders a magenta box of size 102x16 starting at (362, 239).
; PLAN: r0=362(x), r1=239(y), r2=102(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 239
LDI r2, 102
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
