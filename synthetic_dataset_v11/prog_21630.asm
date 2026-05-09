; DESCRIPTION: Places a black 16x48 rectangle at position (72, 14).
; PLAN: r0=72(x), r1=14(y), r2=16(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 14
LDI r2, 16
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
