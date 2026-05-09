; DESCRIPTION: Places a cyan 36x82 rectangle at position (67, 32).
; PLAN: r0=67(x), r1=32(y), r2=36(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 32
LDI r2, 36
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
