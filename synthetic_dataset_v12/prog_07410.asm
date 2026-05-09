; DESCRIPTION: Places a red 81x70 rectangle at position (401, 80).
; PLAN: r0=401(x), r1=80(y), r2=81(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 80
LDI r2, 81
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
