; DESCRIPTION: Places a yellow 25x71 rectangle at position (152, 128).
; PLAN: r0=152(x), r1=128(y), r2=25(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 128
LDI r2, 25
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
