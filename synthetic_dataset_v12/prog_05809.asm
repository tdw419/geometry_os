; DESCRIPTION: Places a red 86x11 rectangle at position (401, 85).
; PLAN: r0=401(x), r1=85(y), r2=86(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 85
LDI r2, 86
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
