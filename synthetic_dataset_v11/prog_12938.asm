; DESCRIPTION: Places a magenta 46x44 rectangle at position (49, 202).
; PLAN: r0=49(x), r1=202(y), r2=46(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 202
LDI r2, 46
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
