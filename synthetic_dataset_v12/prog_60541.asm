; DESCRIPTION: Places a green 43x73 rectangle at position (346, 127).
; PLAN: r0=346(x), r1=127(y), r2=43(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 127
LDI r2, 43
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
