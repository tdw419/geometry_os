; DESCRIPTION: Places a cyan 113x81 rectangle at position (352, 42).
; PLAN: r0=352(x), r1=42(y), r2=113(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 42
LDI r2, 113
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
