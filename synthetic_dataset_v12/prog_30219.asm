; DESCRIPTION: Places a magenta 77x117 rectangle at position (295, 14).
; PLAN: r0=295(x), r1=14(y), r2=77(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 14
LDI r2, 77
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
