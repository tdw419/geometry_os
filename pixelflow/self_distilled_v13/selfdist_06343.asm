; DESCRIPTION: Creates a cyan filled rectangle of size 14x38 starting at (387, 134).
; PLAN: r0=387(x), r1=134(y), r2=14(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 134
LDI r2, 14
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
