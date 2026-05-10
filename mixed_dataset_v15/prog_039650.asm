; DESCRIPTION: Places a blue 46x95 rectangle at position (370, 28).
; PLAN: r0=370(x), r1=28(y), r2=46(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 28
LDI r2, 46
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
