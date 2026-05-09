; DESCRIPTION: Places a cyan 50x82 rectangle at position (84, 103).
; PLAN: r0=84(x), r1=103(y), r2=50(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 103
LDI r2, 50
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
