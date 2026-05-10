; DESCRIPTION: Places a red 95x72 box at position (320, 62).
; PLAN: r0=320(x), r1=62(y), r2=95(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 62
LDI r2, 95
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
