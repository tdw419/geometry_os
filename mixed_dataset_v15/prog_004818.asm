; DESCRIPTION: Places a cyan 109x49 rectangle at position (285, 161).
; PLAN: r0=285(x), r1=161(y), r2=109(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 161
LDI r2, 109
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
