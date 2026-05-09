; DESCRIPTION: Places a red 46x20 rectangle at position (10, 218).
; PLAN: r0=10(x), r1=218(y), r2=46(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 218
LDI r2, 46
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
