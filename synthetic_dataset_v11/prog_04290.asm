; DESCRIPTION: Places a cyan 16x67 rectangle at position (150, 96).
; PLAN: r0=150(x), r1=96(y), r2=16(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 96
LDI r2, 16
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
