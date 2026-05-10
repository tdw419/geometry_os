; DESCRIPTION: Places a cyan 63x32 rectangle at position (103, 27).
; PLAN: r0=103(x), r1=27(y), r2=63(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 27
LDI r2, 63
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
