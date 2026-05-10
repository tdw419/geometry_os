; DESCRIPTION: Places a orange 93x28 rectangle at position (401, 192).
; PLAN: r0=401(x), r1=192(y), r2=93(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 192
LDI r2, 93
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
