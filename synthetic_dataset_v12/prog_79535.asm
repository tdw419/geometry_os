; DESCRIPTION: Places a yellow 88x24 rectangle at position (416, 213).
; PLAN: r0=416(x), r1=213(y), r2=88(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 213
LDI r2, 88
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
