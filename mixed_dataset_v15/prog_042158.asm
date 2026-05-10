; DESCRIPTION: Places a yellow 91x115 rectangle at position (192, 30).
; PLAN: r0=192(x), r1=30(y), r2=91(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 30
LDI r2, 91
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
