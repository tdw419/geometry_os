; DESCRIPTION: Places a white 45x19 rectangle at position (135, 65).
; PLAN: r0=135(x), r1=65(y), r2=45(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 65
LDI r2, 45
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
