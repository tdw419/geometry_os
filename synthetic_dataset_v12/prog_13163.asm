; DESCRIPTION: Places a cyan 10x42 rectangle at position (385, 8).
; PLAN: r0=385(x), r1=8(y), r2=10(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 8
LDI r2, 10
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
