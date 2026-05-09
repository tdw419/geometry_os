; DESCRIPTION: Places a magenta 46x21 rectangle at position (169, 32).
; PLAN: r0=169(x), r1=32(y), r2=46(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 32
LDI r2, 46
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
