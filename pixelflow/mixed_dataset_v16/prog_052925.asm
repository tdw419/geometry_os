; DESCRIPTION: Places a magenta 51x66 rectangle at position (404, 88).
; PLAN: r0=404(x), r1=88(y), r2=51(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 88
LDI r2, 51
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
