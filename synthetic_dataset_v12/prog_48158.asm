; DESCRIPTION: Places a magenta 46x25 rectangle at position (172, 80).
; PLAN: r0=172(x), r1=80(y), r2=46(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 80
LDI r2, 46
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
