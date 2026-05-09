; DESCRIPTION: Places a magenta 35x19 rectangle at position (214, 182).
; PLAN: r0=214(x), r1=182(y), r2=35(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 182
LDI r2, 35
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
