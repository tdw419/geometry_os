; DESCRIPTION: Places a magenta 46x103 rectangle at position (69, 55).
; PLAN: r0=69(x), r1=55(y), r2=46(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 55
LDI r2, 46
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
