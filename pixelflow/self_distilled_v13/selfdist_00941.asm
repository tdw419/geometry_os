; DESCRIPTION: Creates a magenta filled rectangle of size 104x90 starting at (222, 121).
; PLAN: r0=222(x), r1=121(y), r2=104(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 121
LDI r2, 104
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
