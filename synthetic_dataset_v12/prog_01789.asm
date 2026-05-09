; DESCRIPTION: Renders a magenta box of size 108x44 starting at (404, 72).
; PLAN: r0=404(x), r1=72(y), r2=108(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 72
LDI r2, 108
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
