; DESCRIPTION: Places a green 112x61 rectangle at position (172, 137).
; PLAN: r0=172(x), r1=137(y), r2=112(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 137
LDI r2, 112
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
