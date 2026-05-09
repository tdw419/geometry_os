; DESCRIPTION: Places a yellow 38x70 rectangle at position (192, 21).
; PLAN: r0=192(x), r1=21(y), r2=38(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 21
LDI r2, 38
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
