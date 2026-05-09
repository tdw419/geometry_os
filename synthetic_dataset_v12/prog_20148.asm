; DESCRIPTION: Places a magenta 70x20 rectangle at position (169, 167).
; PLAN: r0=169(x), r1=167(y), r2=70(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 167
LDI r2, 70
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
