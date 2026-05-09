; DESCRIPTION: Places a white 62x15 rectangle at position (401, 236).
; PLAN: r0=401(x), r1=236(y), r2=62(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 236
LDI r2, 62
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
