; DESCRIPTION: Places a cyan 115x103 rectangle at position (32, 143).
; PLAN: r0=32(x), r1=143(y), r2=115(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 143
LDI r2, 115
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
