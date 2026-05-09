; DESCRIPTION: Places a magenta 109x54 rectangle at position (401, 54).
; PLAN: r0=401(x), r1=54(y), r2=109(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 54
LDI r2, 109
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
