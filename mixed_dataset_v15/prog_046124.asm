; DESCRIPTION: Places a cyan 68x24 rectangle at position (320, 67).
; PLAN: r0=320(x), r1=67(y), r2=68(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 67
LDI r2, 68
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
