; DESCRIPTION: Places a black 29x42 rectangle at position (187, 197).
; PLAN: r0=187(x), r1=197(y), r2=29(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 197
LDI r2, 29
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
