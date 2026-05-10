; DESCRIPTION: Places a white 76x84 rectangle at position (415, 76).
; PLAN: r0=415(x), r1=76(y), r2=76(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 76
LDI r2, 76
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
