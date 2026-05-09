; DESCRIPTION: Places a white 45x50 rectangle at position (135, 184).
; PLAN: r0=135(x), r1=184(y), r2=45(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 184
LDI r2, 45
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
