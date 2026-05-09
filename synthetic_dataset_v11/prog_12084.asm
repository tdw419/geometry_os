; DESCRIPTION: Places a yellow 12x24 rectangle at position (239, 30).
; PLAN: r0=239(x), r1=30(y), r2=12(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 30
LDI r2, 12
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
