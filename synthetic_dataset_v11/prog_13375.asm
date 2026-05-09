; DESCRIPTION: Places a white 34x48 rectangle at position (72, 155).
; PLAN: r0=72(x), r1=155(y), r2=34(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 155
LDI r2, 34
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
