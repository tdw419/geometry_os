; DESCRIPTION: Places a cyan 92x11 rectangle at position (67, 109).
; PLAN: r0=67(x), r1=109(y), r2=92(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 109
LDI r2, 92
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
