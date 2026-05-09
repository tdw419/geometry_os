; DESCRIPTION: Places a cyan 67x42 rectangle at position (161, 196).
; PLAN: r0=161(x), r1=196(y), r2=67(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 196
LDI r2, 67
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
