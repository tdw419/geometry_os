; DESCRIPTION: Places a yellow 65x67 rectangle at position (175, 108).
; PLAN: r0=175(x), r1=108(y), r2=65(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 108
LDI r2, 65
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
