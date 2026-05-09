; DESCRIPTION: Places a white 84x48 rectangle at position (411, 40).
; PLAN: r0=411(x), r1=40(y), r2=84(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 40
LDI r2, 84
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
