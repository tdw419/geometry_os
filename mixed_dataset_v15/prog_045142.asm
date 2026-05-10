; DESCRIPTION: Places a cyan 113x113 rectangle at position (42, 48).
; PLAN: r0=42(x), r1=48(y), r2=113(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 48
LDI r2, 113
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
