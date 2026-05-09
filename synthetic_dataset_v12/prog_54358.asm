; DESCRIPTION: Places a magenta 46x87 rectangle at position (50, 168).
; PLAN: r0=50(x), r1=168(y), r2=46(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 168
LDI r2, 46
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
