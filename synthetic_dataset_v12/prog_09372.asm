; DESCRIPTION: Places a cyan 42x54 rectangle at position (160, 7).
; PLAN: r0=160(x), r1=7(y), r2=42(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 7
LDI r2, 42
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
