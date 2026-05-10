; DESCRIPTION: Places a cyan 43x60 rectangle at position (440, 165).
; PLAN: r0=440(x), r1=165(y), r2=43(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 165
LDI r2, 43
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
