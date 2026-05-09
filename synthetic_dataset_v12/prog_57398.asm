; DESCRIPTION: Places a yellow 46x35 rectangle at position (255, 189).
; PLAN: r0=255(x), r1=189(y), r2=46(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 189
LDI r2, 46
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
