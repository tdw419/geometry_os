; DESCRIPTION: Places a black 72x28 rectangle at position (401, 193).
; PLAN: r0=401(x), r1=193(y), r2=72(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 193
LDI r2, 72
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
