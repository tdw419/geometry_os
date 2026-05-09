; DESCRIPTION: Places a white 37x64 rectangle at position (401, 132).
; PLAN: r0=401(x), r1=132(y), r2=37(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 132
LDI r2, 37
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
