; DESCRIPTION: Places a cyan 113x18 rectangle at position (104, 197).
; PLAN: r0=104(x), r1=197(y), r2=113(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 197
LDI r2, 113
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
