; DESCRIPTION: Places a white 17x91 rectangle at position (415, 72).
; PLAN: r0=415(x), r1=72(y), r2=17(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 72
LDI r2, 17
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
