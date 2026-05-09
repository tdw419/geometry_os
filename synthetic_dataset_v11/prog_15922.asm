; DESCRIPTION: Places a cyan 78x32 rectangle at position (168, 89).
; PLAN: r0=168(x), r1=89(y), r2=78(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 89
LDI r2, 78
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
