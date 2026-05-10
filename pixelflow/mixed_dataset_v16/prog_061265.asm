; DESCRIPTION: Places a purple 52x91 rectangle at position (401, 108).
; PLAN: r0=401(x), r1=108(y), r2=52(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 108
LDI r2, 52
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
