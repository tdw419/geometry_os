; DESCRIPTION: Places a magenta 46x55 rectangle at position (172, 54).
; PLAN: r0=172(x), r1=54(y), r2=46(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 54
LDI r2, 46
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
