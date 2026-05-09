; DESCRIPTION: Places a white 50x64 rectangle at position (33, 31).
; PLAN: r0=33(x), r1=31(y), r2=50(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 31
LDI r2, 50
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
