; DESCRIPTION: Places a magenta 65x55 rectangle at position (1, 47).
; PLAN: r0=1(x), r1=47(y), r2=65(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 47
LDI r2, 65
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
