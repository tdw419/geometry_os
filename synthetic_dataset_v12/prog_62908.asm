; DESCRIPTION: Places a green 104x61 rectangle at position (230, 27).
; PLAN: r0=230(x), r1=27(y), r2=104(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 27
LDI r2, 104
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
