; DESCRIPTION: Places a cyan 46x88 rectangle at position (266, 79).
; PLAN: r0=266(x), r1=79(y), r2=46(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 79
LDI r2, 46
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
