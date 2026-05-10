; DESCRIPTION: Places a cyan 113x42 rectangle at position (59, 5).
; PLAN: r0=59(x), r1=5(y), r2=113(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 5
LDI r2, 113
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
