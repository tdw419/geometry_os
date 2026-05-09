; DESCRIPTION: Places a white 48x72 rectangle at position (90, 100).
; PLAN: r0=90(x), r1=100(y), r2=48(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 100
LDI r2, 48
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
