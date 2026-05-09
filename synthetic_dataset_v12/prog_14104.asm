; DESCRIPTION: Places a green 95x64 rectangle at position (276, 43).
; PLAN: r0=276(x), r1=43(y), r2=95(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 43
LDI r2, 95
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
