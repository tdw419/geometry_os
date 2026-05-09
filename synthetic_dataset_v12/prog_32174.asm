; DESCRIPTION: Places a black 75x50 rectangle at position (197, 178).
; PLAN: r0=197(x), r1=178(y), r2=75(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 178
LDI r2, 75
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
