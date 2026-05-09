; DESCRIPTION: Places a magenta 48x120 rectangle at position (77, 135).
; PLAN: r0=77(x), r1=135(y), r2=48(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 135
LDI r2, 48
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
