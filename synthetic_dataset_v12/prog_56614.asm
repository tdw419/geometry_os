; DESCRIPTION: Places a white 62x28 rectangle at position (135, 109).
; PLAN: r0=135(x), r1=109(y), r2=62(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 109
LDI r2, 62
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
